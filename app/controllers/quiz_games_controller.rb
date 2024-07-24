require 'net/http'
require 'fileutils'

class QuizGamesController < ApplicationController

  INIT_PARAMS = {
      'name' => 'New Game',
      'questions_source' => 'Gpt4AiQuestions::MythicalLocationsQuestion'
    }

  REDIS_EXPIRING_TIMER = 120

  before_action :set_quiz_game, only: [ :show, :edit, :update, :destroy ]

  def index
    if params[:invite].present?
      encrypted_url = params[:invite]
      _, quiz_game_id = ApplicationRecord.decrypt_url(encrypted_url) # user_id, quiz_game_id
      quiz_game = QuizGame.find_by(id: quiz_game_id)

      if quiz_game.nil?
        redirect_to root_path
        return
      end

      if !current_user.quiz_games.include?(quiz_game)
        current_user.quiz_games << quiz_game
      end

      if quiz_game.game_status == "configuring"
        redirect_to edit_quiz_game_path(quiz_game)
      else
        redirect_to quiz_game_path(quiz_game)
      end

    else
      @quiz_games = current_user.quiz_games
    end
  end

  def show
    if params[:player_action] == 'option_сlicked'
      player = @quiz_game.quiz_players.find_by(player_id: current_user.id)

      Turbo::StreamsChannel.broadcast_append_to(
        "quiz_game_show_#{@quiz_game.id}",
        target: "main_form_option_#{params[:main_form][:player_answer]}",
        partial: "quiz_games/game/player_choice",
        locals: { player_color: player.player_color }
      )
      head :ok
      return
    end

    if params[:player_action] == 'form_submit'
      Turbo::StreamsChannel.broadcast_action_to(
        "quiz_game_show_#{@quiz_game.id}",
        action: 'form_submit'
      )
      head :ok
      return

    end

    questions_model = Object.const_get(@quiz_game.questions_source)
    @questions_quantity = questions_model.count
    questions_counter = @quiz_game.questions_counter
    @current_question = questions_model.find_by(id: questions_counter)
    main_form_params = params[:main_form]

    if main_form_params.present?

      if main_form_params[:request_type] == "next"

        if questions_counter >= @questions_quantity
          render :show, locals: {response_type: "end"}
          return
        end

        if @quiz_game.quiz_players.count > 1
          redis = Redis.new
          requests_counter = redis.incr('requests_counter')
          if requests_counter >= @quiz_game.quiz_players.count
            redis.set('requests_counter', 0)
            render :show, locals: {response_type: "next"}
            return
          end
        end

        @quiz_game.update!(questions_counter: questions_counter + 1)
        @current_question = questions_model.find_by(id: @quiz_game.questions_counter)

        render :show, locals: {response_type: "next"}

      elsif main_form_params[:request_type] == "restart"

        @quiz_game.update!(questions_counter: 1)
        @current_question = questions_model.find_by(id: @quiz_game.questions_counter)
        @quiz_game.quiz_players.each do |quiz_player|
          quiz_player.player_answers = []
          quiz_player.save!
        end

        render :show, locals: {response_type: "answer"}

      else

        guiz_player = QuizPlayer.find_by(player_id: current_user.id)
        player_answer = ((main_form_params[:player_answer] == @current_question.correct_answer) ? 1 : 0)
        guiz_player.player_answers << player_answer
        guiz_player.save!

        head :ok

        # render :show, locals: {response_type: "answer"}
      end

    else
      guiz_player = QuizPlayer.find_by(player_id: current_user.id)
      if !@quiz_game.quiz_players.include?(guiz_player)
        @quiz_game.quiz_players.create(player_id: current_user.id, player_color: set_player_color(current_user.id))
      end

      render :show, locals: {response_type: "next"}
    end

  end

  def create
    @quiz_game = current_user.quiz_games.build

    respond_to do |format|
      if current_user.save
        format.html { redirect_to edit_quiz_game_path(@quiz_game), notice: "quiz_game was successfully created." }
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  def edit
    if @quiz_game.game_status == "started"
      redirect_to quiz_game_path(@quiz_game)
      return
    end

    redis = Redis.new

    if params[:quiz_game].present?
      redis.setex("quiz_game_edit_#{@quiz_game.id}", REDIS_EXPIRING_TIMER, params[:quiz_game].to_json)
      @config_params = params[:quiz_game]
    else
      if redis_data = redis.get("quiz_game_edit_#{@quiz_game.id}")
        @config_params = JSON.parse(redis_data)
      else
        redis.setex("quiz_game_edit_#{@quiz_game.id}", REDIS_EXPIRING_TIMER, INIT_PARAMS.to_json)
        @config_params = INIT_PARAMS
      end
    end

    if params[:quiz_game].present?
      client_id = params[:client_id]

      Turbo::StreamsChannel.broadcast_update_later_to(
        "quiz_game_edit_#{@quiz_game.id}",
        target: "quiz_game_#{@quiz_game.id}",
        partial: "quiz_games/form",
        locals: {
          url: quiz_game_path(@quiz_game),
          config_params: @config_params,
          client_id: client_id,
          model_names: get_models_names
        }.as_json
      )

      head :ok
    else
      render :edit, locals: {config_params: @config_params, model_names: get_models_names}
    end
  end

  def update

    if @quiz_game.game_status == "started"
      redirect_to quiz_game_path(@quiz_game), notice: "Game was already started."
      return
    end

    redis = Redis.new
    redis.del("quiz_game_#{@quiz_game.id}")

    if @quiz_game.update(quiz_game_params.merge(game_status: 'started'))

      Turbo::StreamsChannel.broadcast_update_later_to(
        "quiz_game_edit_#{@quiz_game.id}",
        target: "quiz_game_#{@quiz_game.id}",
        html: "<meta url='#{quiz_game_path(@quiz_game)}'/>"
      )
      head :ok
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.quiz_games.destroy(@quiz_game)

    if @quiz_game.users.count == 0
      @quiz_game.destroy
    end

    respond_to do |format|
      format.html { redirect_to quiz_games_url, notice: "quiz_game was successfully destroyed." }
    end
  end

  private

    def set_quiz_game
      @quiz_game = current_user.quiz_games.find_by(id: params[:id])
      if @quiz_game.nil?
        redirect_to root_path
      end
    end

    def quiz_game_params
      params.require(:quiz_game).permit(:name, :questions_source)
    end

    def set_player_color(player_id)
      hue = (((player_id - 1) * 137.508) % 360)
      "hsl(#{hue}, 100%, 50%)"
    end

    def get_models_names
      model_dir = Rails.root.join('app', 'models', 'prepared_questions')

      Dir.glob("#{model_dir}/*.rb").map do |file_path|
        file_name = File.basename(file_path, '.rb')
        class_name = file_name.split('_').collect(&:capitalize).join
        namespaced_class_name = "PreparedQuestions::#{class_name}"
        namespaced_class_name
      end
    end

end

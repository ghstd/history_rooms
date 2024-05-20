class QuizGamesController < ApplicationController

  INIT_PARAMS = {
      'name' => 'New Game',
      'questions_source' => 'first'
    }

  REDIS_EXPIRING_TIMER = 300

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
      redis.setex("quiz_game_#{@quiz_game.id}", REDIS_EXPIRING_TIMER, params[:quiz_game].to_json)
      @config_params = params[:quiz_game]
    else
      if redis_data = redis.get("quiz_game_#{@quiz_game.id}")
        @config_params = JSON.parse(redis_data)
      else
        redis.setex("quiz_game_#{@quiz_game.id}", REDIS_EXPIRING_TIMER, INIT_PARAMS.to_json)
        @config_params = INIT_PARAMS
      end
    end

    if params[:quiz_game].present?
      client_id = params[:client_id]

      Turbo::StreamsChannel.broadcast_update_later_to(
        @quiz_game,
        target: "quiz_game_#{@quiz_game.id}",
        partial: "quiz_games/form",
        locals: { url: quiz_game_path(@quiz_game), config_params: @config_params, client_id: client_id }.as_json
      )

      head :ok
    else
      render :edit, locals: {config_params: @config_params}
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
        @quiz_game,
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
end

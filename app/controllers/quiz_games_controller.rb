class QuizGamesController < ApplicationController
  before_action :set_quiz_game, only: [ :show, :edit, :update, :destroy ]

  def index
    if params[:invite].present?
      encrypted_url = params[:invite]
      user_id, quiz_game_id = ApplicationRecord.decrypt_url(encrypted_url)
      quiz_game = QuizGame.find_by(id: quiz_game_id)

      if quiz_game.nil?
        redirect_to root_path
        return
      end

      if !current_user.quiz_games.include?(quiz_game)
        current_user.quiz_games << quiz_game
      end
      redirect_to quiz_game_url(quiz_game)
    else
      @quiz_games = current_user.quiz_games
    end
  end

  def show
  end

  def new
    @quiz_game = current_user.quiz_games.build
  end

  def edit
  end

  def create
    @quiz_game = current_user.quiz_games.build(quiz_game_params)

    respond_to do |format|
      if current_user.save
        format.html { redirect_to quiz_game_url(@quiz_game), notice: "quiz_game was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @quiz_game.update(quiz_game_params)
        format.html { redirect_to quiz_game_url(@quiz_game), notice: "quiz_game was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
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
      params.require(:quiz_game).permit(:name)
    end
end

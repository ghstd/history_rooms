class QuizGameUser < ApplicationRecord
  belongs_to :user
  belongs_to :quiz_game



  # "player_answers" = []
  # "player_color"
end

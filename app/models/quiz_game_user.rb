class QuizGameUser < ApplicationRecord
  belongs_to :user
  belongs_to :quiz_game
end

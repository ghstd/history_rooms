class QuizPlayer < ApplicationRecord
  serialize :player_answers, coder: JSON
  belongs_to :quiz_game
end

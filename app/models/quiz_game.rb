class QuizGame < ApplicationRecord
  has_many :quiz_game_users
  has_many :users, through: :quiz_game_users
  has_many :quiz_players, dependent: :destroy
end

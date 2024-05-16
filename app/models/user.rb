class User < ApplicationRecord
  has_and_belongs_to_many :notes

  has_many :quiz_game_users
  has_many :quiz_games, through: :quiz_game_users

  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable,
          omniauth_providers: [:facebook, :google_oauth2, :github]

  enum role: { user: 0, admin: 1 }
end

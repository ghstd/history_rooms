class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable,
         omniauth_providers: [:facebook, :google_oauth2, :github]
end

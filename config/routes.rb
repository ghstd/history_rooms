Rails.application.routes.draw do
  root "rooms#new"

  devise_for :users,
  omniauth_providers: [:facebook, :google_oauth2, :github],
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :rooms, only: [:new, :create, :show, :destroy] do
    resources :messages, only: [:create]
    resources :questions, only: [:create]
  end

end

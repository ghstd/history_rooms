Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users,
  omniauth_providers: [:facebook, :google_oauth2, :github],
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :admin, only: [:index, :create, :update]
  resources :notes do
    resources :note_items, only: [:new, :create, :edit, :update, :destroy]
  end




  resources :rooms, only: [:new, :create, :show, :destroy] do
    resources :messages, only: [:create]
    resources :questions, only: [:create]
  end

end

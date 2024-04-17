Rails.application.routes.draw do
  root "rooms#new"

  resources :users, only: [:new, :create]

  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :rooms, only: [:new, :create, :show, :destroy] do
    resources :messages, only: [:create]
    resources :questions, only: [:create]
  end

end

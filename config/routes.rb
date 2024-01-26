Rails.application.routes.draw do
  resources :rooms
  root "pages#home"
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  get 'user/:id', to: 'users#show', as: 'user'
end

Rails.application.routes.draw do
  resources :rooms do
    resources :messages
  end
  root 'pages#home'
  devise_for :users, controllers: {
    sesions: 'users/sessions',
    registrations: 'users/registrations'
  }
 
  get 'user/:id', to: 'users#show', as: 'user'

end
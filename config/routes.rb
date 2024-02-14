Rails.application.routes.draw do
  resources :rooms do
    resources :messages
    collection do
      post :search
    end
  end
    # leave_room_path(room)
    get 'rooms/leave/:id', to: 'rooms#leave', as: 'leave_room'
    # join_room_path(room)
    get 'rooms/join/:id', to: 'rooms#join', as: 'join_room' 
    
  root 'pages#home'
  devise_for :users, controllers: {
    sesions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'user/:id', to: 'users#show', as: 'user'
end

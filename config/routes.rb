Todo1::Application.routes.draw do
  resources :projects do
    resources :tasks  
  end
  root to: 'projects#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
end

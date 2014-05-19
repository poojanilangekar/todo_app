Rails.application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy] 
  resources :tasks, only: [:create, :destroy]
  root to: 'static_pages#home'
  match '/', to: 'static_pages#home', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get' 
  match '/signup', to: 'users#new', via: 'get' 
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/tasks/complete', to: 'tasks#complete', via: 'post'
end 

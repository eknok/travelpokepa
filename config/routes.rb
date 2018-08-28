Rails.application.routes.draw do

  resources :posts
  devise_for :users
  resources :users, only: [:show]

  get '/about', to: 'toppages#show'
  root 'toppages#index'
end

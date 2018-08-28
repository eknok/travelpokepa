Rails.application.routes.draw do
  resources :posts
  devise_for :users
  get '/about', to: 'toppages#show'
  root 'toppages#index'
end

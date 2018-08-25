Rails.application.routes.draw do
  devise_for :users
  get '/about', to: 'toppages#show'
  root 'toppages#index'
end

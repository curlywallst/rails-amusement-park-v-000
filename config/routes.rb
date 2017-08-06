
Rails.application.routes.draw do

  resources :users
  resources :attractions
  resources :application
  resources :rides
  post '/sessions' => 'sessions#create'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/signin' => 'sessions#new'
  delete '/signout' => 'sessions#destroy'

  get '/rideit' => 'attractions#rideit'

  root 'application#new'



end

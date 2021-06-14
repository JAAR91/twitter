Rails.application.routes.draw do
  root 'posts#index'

  resources :users do
    resources :followers, only: [:create, :destroy]
    resources :posts
    resources :coments, only: [:new, :create]
  end

  resources :posts, only: [:show]

  get '/ousers', to: 'posts#ousers'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
end

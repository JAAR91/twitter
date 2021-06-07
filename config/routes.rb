Rails.application.routes.draw do
  root 'posts#index'

  resources :users do
    resources :posts
  end

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
end

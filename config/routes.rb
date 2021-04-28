Rails.application.routes.draw do
  root 'sessions#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #logout route
  delete '/logout' => 'sessions#logout'

  #omniauth
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  resources :discusses
  resources :lessons
  resources :roles
  resources :users, only: [:new, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

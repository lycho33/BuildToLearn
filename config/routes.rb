Rails.application.routes.draw do
  resources :discusses
  resources :lessons
  resources :mentors
  resources :students
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

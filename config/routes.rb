Rails.application.routes.draw do
  devise_for :users
  root "static#landing_page"
  resources :users, only: [:show]
  resources :conversations
end
# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'static#landing_page'
  resources :users, only: [:show]
  resources :conversations
  resources :invitations, only: %i[new create]
  resources :chat_messages
end

# frozen_string_literal: true

Rails.application.routes.draw do
  # RESTful routes
  resources :examples, except: %i[new edit]
  resources :users, only: %i[index show update]
  resources :projects, only: %i[index show update create destroy]
  resources :stories, only: %i[index show update create]
  resources :tasks, only: %i[index show update create]

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  put '/change-password' => 'users#changepw'

end

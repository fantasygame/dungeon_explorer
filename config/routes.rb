Rails.application.routes.draw do

  root 'team#index'

  resources :characters
  resources :teams
  devise_for :users
end

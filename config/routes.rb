Rails.application.routes.draw do
  resources :characters
  resources :teams
  devise_for :users
end

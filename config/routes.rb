Rails.application.routes.draw do

  root 'team#index'

  resources :teams do
    resources :characters
  end
  devise_for :users
end

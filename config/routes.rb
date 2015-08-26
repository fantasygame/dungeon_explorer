Rails.application.routes.draw do

  root 'teams#index'

  resources :teams do
    resources :characters
  end
  devise_for :users
end

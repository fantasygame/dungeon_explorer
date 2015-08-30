Rails.application.routes.draw do

  root 'teams#index'

  resources :teams do
    resources :characters
    member do
      get :draw_treasure
      get :draw_monster
    end
  end
  devise_for :users
end

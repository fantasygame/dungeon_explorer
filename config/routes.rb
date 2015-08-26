Rails.application.routes.draw do

  root 'teams#index'

  resources :teams do
    resources :characters
  end
  devise_for :users

  get '/draw_treasure/:level', to: 'draw#draw_treasure'
  get '/draw_monster/:level', to: 'draw#draw_monster'
end

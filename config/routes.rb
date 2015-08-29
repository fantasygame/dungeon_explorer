Rails.application.routes.draw do

  root 'teams#index'

  resources :teams do
    resources :characters
  end
  devise_for :users

  get '/draw_treasure/:team_id', to: 'draw#draw_treasure'
  get '/draw_monster/:team_id', to: 'draw#draw_monster'
end

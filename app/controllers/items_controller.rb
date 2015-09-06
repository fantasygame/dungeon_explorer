class ItemsController < ApplicationController
  expose(:item, attributes: :team_params)
  expose(:team)
  expose(:items) { team.items.page(params[:page]) }
  expose(:item)
end

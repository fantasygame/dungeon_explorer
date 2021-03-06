class Item < ActiveRecord::Base
  has_many :teams, through: :team_items
  has_many :team_items
  paginates_per 20
end

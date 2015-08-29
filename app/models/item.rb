class Item < ActiveRecord::Base
  has_many :teams, through: :team_items
end

class TeamItem < ActiveRecord::Base
  belongs_to :team
  belongs_to :item
end

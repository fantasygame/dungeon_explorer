class Team < ActiveRecord::Base
  has_many :characters, dependent: :destroy
  has_many :items, through: :team_items
  validates :name, presence: :true

  def to_s
    name
  end

  def level
  return 1 if characters.empty?
    else avglevel

  end
end


private

def avglevel
  teamlevel = []
  characters.each do |character|
    teamlevel << character.level
  end
  return (teamlevel.inject(0.00){ |sum, el| sum + el } / teamlevel.size).round
end

class Team < ActiveRecord::Base
  has_many :characters, dependent: :destroy
  has_many :items, through: :team_items
  has_many :team_items
  has_many :users, through: :memberships
  has_many :memberships
  validates :name, presence: :true
  alias_method :members, :users

  def to_s
    name
  end

  def member?(user)
    memberships.include?(user)
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

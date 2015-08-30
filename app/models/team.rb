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
    average_team_level
  end


private

  def average_team_level
    level_sum = 0
    characters.each {|character| level_sum += character.level }
    (level_sum.to_f/characters.size).round
  end

end
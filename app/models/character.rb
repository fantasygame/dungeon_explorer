class Character < ActiveRecord::Base
  belongs_to :team
  validates :name, presence: :true

  def level
    lvl = LevelCalculator.new(experience, 0).level
  end
end

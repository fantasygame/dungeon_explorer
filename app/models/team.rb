class Team < ActiveRecord::Base
  has_many :characters, dependent: :destroy
  validates :name, presence: :true

  def to_s
    name
  end
end

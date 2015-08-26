class Character < ActiveRecord::Base
  belongs_to :team
  validates :name, presence: :true


  def level
    lvl = exp_to_level(experience)
  end

  private


  def exp_to_level(exp)
    values = {
        1 => 0,
        2 => 1000,
        3 => 3000,
        4 => 6000,
        5 => 10000,
        6 => 15000,
        7 => 21000,
        8 => 28000,
        9 => 36000,
        10 => 45000,
        11 => 55000,
        12 => 66000,
        13 => 78000,
        14 => 91000,
        15 => 105000,
        16 => 120000,
        17 => 136000,
        18 => 153000,
        19 => 171000,
        20 => 190000,
        21 => 9999999999999
    }
    for i in 1..20
      if (exp >= values[i]) & (exp < values[i+1])
        return i;
      end
    end
  end


end

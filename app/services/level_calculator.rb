class LevelCalculator
  attr_reader :experience, :character_level

  def initialize(experience, character_level)
    @experience = experience
    @character_level = character_level
  end

  def level
    lvl = exp_to_level(experience)
  end

  def level_to_experience
    exp = lvl_to_exp(character_level)
  end

  private

  def level_table
    {
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
    }
  end

  def exp_to_level(exp)
    level_table.reverse_each do |level, level_exp|
      return level if exp >= level_exp
    end
  end

  def lvl_to_exp(lvl)
    level_table.each do |level, level_exp|
      return level_exp if lvl == level
    end
  end
end

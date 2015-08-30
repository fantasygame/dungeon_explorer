class EncounterExperience
  attr_reader :team_level, :challenge_rating

  def initialize(team_level, challenge_rating)
    @team_level = team_level
    @challenge_rating = challenge_rating
  end

  def call
    exp = case
    when level_difference == 0
      base_exp
    when level_difference == -1
      200 * team_level_fixed
    when level_difference == -2
      base_exp / 2
    when level_difference == -3
      base_exp / 3
    when level_difference == -4
      base_exp / 4
    when level_difference == -5
      base_exp / 6
    when level_difference == -6
      base_exp / 8
    when level_difference == -7
      base_exp / 12
    when level_difference > 0
      return 0 if level_difference > 7
      return 400 * team_level_fixed if level_difference == 1
      sum = base_exp * 2
      i = 2
      (level_difference - 2).times do
        sum += base_exp * calculate_multiplayer(i / 2)
        i += 1
      end
      sum
    else
      0
    end
    exp = 300 if challenge_rating == 1 && exp > 300
    exp
  end

  private

  def calculate_multiplayer(m)
    multiplayer = 1
    (m - 1).times do
      multiplayer = multiplayer + multiplayer
    end
    multiplayer
  end

  def level_difference
    challenge_rating - team_level_fixed
  end

  def base_exp
    team_level_fixed * 300
  end

  def team_level_fixed
    team_level < 3 ? 3 : team_level
  end
end

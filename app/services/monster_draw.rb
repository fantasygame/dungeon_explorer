class MonsterDraw
  attr_reader :level

  def initialize(level = 10)
    @level = level
  end

  def call
    monster_level = draw_monster_level
    monster_quantity = draw_monster_quantity(monster_level)
    monster = draw_random_monster(monster_level)
    { monster: monster, quantity: monster_quantity }
  end

  def draw_monster_level
    enemy_level = level - rand(-1..5)
    enemy_level = 1 if enemy_level < 1
    enemy_level
  end

  def draw_monster_quantity(draw_monster_level)
    if [level, level + 1, level - 1].include?(draw_monster_level)
      1
    else
      level - draw_monster_level
    end
  end

  def draw_random_monster(draw_monster_level)
    monsters = Monster.all.where(challenge_rating: draw_monster_level)
    monster = monsters.sample
    monster
  end
end

class CharacterDecorator < Draper::Decorator
  delegate_all

  def level_experience(level)
    exp = LevelCalculator.new(experience, level).level_to_experience
  end

  def next_level_experience(level, experience)
    level_experience(level) - experience
  end
end

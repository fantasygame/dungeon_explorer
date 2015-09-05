class MonsterDecorator < Draper::Decorator
  delegate_all

  def name_pluralize(number)
    name = object.name.split(',')
    name[0] = name[0].pluralize if number > 1
    name.join(',')
  end
end

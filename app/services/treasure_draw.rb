class TreasureDraw
  attr_reader :level

  def initialize(level)
    @level = level
  end

  def call
    treasure_value = level_value
    money = draw_money(treasure_value)
    items_value = treasure_value - money
    items = draw_items(items_value)
    treasure = Treasure.new(items, money)
    treasure.money += treasure_value - treasure.worth
    treasure
  end

  private

  def draw_items(items_value)
    items = []
    # each item 25-100% items_value
    min_value = items_value / 4
    max_value = items_value
    while min_value <= max_value
      item = draw_item(min_value, max_value)
      break unless item
      max_value -= item.price
      items << item
    end
    items
  end

  def draw_item(min_value, max_value)
    item_ids = Item
               .where('price >= ? AND price <= ?', min_value, max_value)
               .pluck(:id)
    return false if item_ids.empty?
    Item.find(item_ids.sample)
  end

  def draw_money(treasure_value)
    # money 0-50% of treasure value
    rand(treasure_value / 2) + 1
  end

  def level_value
    values = {
      1 => 300,
      2 => 600,
      3 => 900,
      4 => 1200,
      5 => 1600,
      6 => 2000,
      7 => 2600,
      8 => 3400,
      9 => 4500,
      10 => 5800,
      11 => 7500,
      12 => 9800,
      13 => 13_000,
      14 => 17_000,
      15 => 22_000,
      16 => 28_000,
      17 => 36_000,
      18 => 47_000,
      19 => 61_000,
      20 => 80_000
    }
    values[level]
  end
end

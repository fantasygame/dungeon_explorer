class Treasure
  attr_accessor :items, :money

  def initialize(items, money)
    @items = items
    @money = money
  end

  def worth
    worth = money
    items.each { |item| worth += item.price }
    worth
  end
end

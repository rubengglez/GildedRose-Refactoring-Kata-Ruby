require_relative './factory_item'

class GildedRose

  def initialize(items)
    @items = items.map { |item| FactoryItem.create(item) }
  end

  def update_quality()
    @items.each(&:update_quality)
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
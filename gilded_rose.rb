AGED_BRIE = 'Aged Brie'.freeze
SULFURAS = 'Sulfuras, Hand of Ragnaros'.freeze
BACKSTAGE = 'Backstage passes to a TAFKAL80ETC concert'.freeze
CONJURED = 'Conjured'.freeze

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      next if sulfuras?(item)

      if item.name != AGED_BRIE and item.name != BACKSTAGE
        if item.sell_in > 0
          item.quality = item.quality - 1
        else
          item.quality = [item.quality - 2, 0].max
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == BACKSTAGE
            if item.sell_in < 11
              if item.quality < 50
                item.quality = [item.quality + 1, 50].min
              end
            end
            if item.sell_in < 6
              item.quality = [item.quality + 1, 50].min
            end
          end
        end
      end
      if item.sell_in <= 0
        if item.name != AGED_BRIE
          if item.name == BACKSTAGE
            item.quality = 0
          end
        else
          item.quality = [item.quality + 1, 50].min
        end
      end
    end
  end

  private

  def sulfuras?(item)
    item.name == SULFURAS
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

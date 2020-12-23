require_relative './regular'
require_relative './aged_brie'
require_relative './backstage'
require_relative './conjured'
require_relative './sulfuras'

class FactoryItem
  AGED_BRIE = "Aged Brie".freeze
  SULFURAS = "Sulfuras, Hand of Ragnaros".freeze
  BACKSTAGE = "Backstage passes to a TAFKAL80ETC concert".freeze
  CONJURED = "Conjured".freeze

  def self.create(item)
    case item.name
    when AGED_BRIE
      AgedBrie.new(item)
    when BACKSTAGE
      Backstage.new(item)
    when CONJURED
      Conjured.new(item)
    when SULFURAS
      Sulfuras.new(item)
    else
      Regular.new(item)
    end
  end
end

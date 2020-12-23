require_relative './regular'

class AgedBrie < Regular
  def update_quality
    increase_by = item.sell_in <= 0 ? 2 : 1
    item.quality = [item.quality + increase_by, 50].min
  end
end
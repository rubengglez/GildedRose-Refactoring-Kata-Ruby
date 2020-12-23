require_relative './regular'

class Backstage < Regular
  def update_quality
    if item.sell_in <= 0
      item.quality = 0
    elsif item.sell_in < 6
      item.quality = [item.quality + 3, 50].min
    elsif item.sell_in < 11
      item.quality = [item.quality + 2, 50].min
    else
      item.quality = [item.quality + 1, 50].min
    end
  end
end
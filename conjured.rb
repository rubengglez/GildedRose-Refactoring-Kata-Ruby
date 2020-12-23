require_relative './regular'

class Conjured < Regular
  def update_quality
    item.quality = [item.quality - 2, 0].max
  end
end
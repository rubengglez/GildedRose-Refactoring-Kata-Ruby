class Regular
  def initialize(item)
    @item = item
  end

  def update_quality
    decrease_by = item.sell_in <= 0 ? 2 : 1
    item.quality = [item.quality - decrease_by, 0].max
  end

  private

  attr_reader :item
end
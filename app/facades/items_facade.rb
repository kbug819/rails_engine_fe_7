class ItemsFacade
  attr_reader :item_id

  def initialize(item_info)
    @item_id = item_info[:id]
  end

  def item_info
    item = RailsEngineService.new.item_info(@item_id)
    Item.new(item)
  end
end
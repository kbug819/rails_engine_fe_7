class MerchantsFacade
  attr_reader :merchant_id

  def initialize(merchant_info)
    @merchant_id = merchant_info[:id]
  end

  def merchant_index
    RailsEngineService.new.merchant_list.map do |merchant|
      Merchant.new(merchant)
    end
  end

  def merchant_items
    RailsEngineService.new.merchant_items(@merchant_id).map do |item|
      Item.new(item)
    end
  end
end
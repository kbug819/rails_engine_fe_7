class MerchantsFacade
  attr_reader :merchant_id, :search_by_merchant, :search_term

  def initialize(merchant_info)
    @merchant_id = merchant_info[:id]
    @search_by_merchant = merchant_info[:commit]
    @search_term = merchant_info[:name]
  end

  def merchant_index
    if @search_by_merchant
      RailsEngineService.new.merchant_search(@search_term).map do |merchant|
        Merchant.new(merchant)
      end
    else
      RailsEngineService.new.merchant_list.map do |merchant|
        Merchant.new(merchant)
      end
    end
  end

  def merchant_items
    RailsEngineService.new.merchant_items(@merchant_id).map do |item|
      Item.new(item)
    end
  end
end
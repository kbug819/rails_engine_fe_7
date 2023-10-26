class Item
  attr_reader :id, :name, :description, :unit_price, :merchant_id

  def initialize(item_info)
    @id = item_info[:id]
    @name = item_info[:attributes][:name]
    @description = item_info[:attributes][:description]
    @unit_price = item_info[:attributes][:unit_price]
    @merchant_id = item_info[:attributes][:merchant_id]
  end
end
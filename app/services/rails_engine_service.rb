class RailsEngineService
  
  def item_info(item_id)
    response = connection.get("/api/v1/items/#{item_id}")
    JSON.parse(response.body, symbolize_names:true)[:data]
  end

  def merchant_items(merchant_id)
    response = connection.get("/api/v1/merchants/#{merchant_id}/items")
    JSON.parse(response.body, symbolize_names:true)[:data]

  end
  
  def merchant_list
    response = connection.get("/api/v1/merchants")
    JSON.parse(response.body, symbolize_names:true)[:data]
  end
  
  def connection
    Faraday.new(url: 'http://localhost:3000')
  end
end

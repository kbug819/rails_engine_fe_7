class MerchantsController < ApplicationController

  def index
    @facade = MerchantsFacade.new(params)
  end

  def show
    @merchant_name = params[:name]
    @facade = MerchantsFacade.new(params)
  end
end
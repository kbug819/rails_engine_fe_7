class ItemsController < ApplicationController

  def show
    @facade = ItemsFacade.new(params)
  end
end
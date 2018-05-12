class PagesController < ApplicationController
  before_action :authorize, only: [:secret]

  def buildbox
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def secret
  end
end

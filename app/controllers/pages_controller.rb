class PagesController < ApplicationController
  before_action :authorize, only: [:secret]

  def buildbox
    def create
      @order = current_order
      @order.status = OrderStatus.in_progress.id
      @order_item = @order.order_items.new(order_item_params)
      @order.save
      session[:order_id] = @order.id
    end

    def update
      @order = current_order
      @order_item = @order.order_items.find(params[:id])
      @order_item.update_attribute(:orderitems_quantity, order_item_params[:orderitems_quantity])
    end



  end

  private

  def order_item_params
    params.require(:order_item).permit(:orderitems_quantity, :product_id)
  end

end

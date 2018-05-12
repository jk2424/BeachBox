class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order.status = OrderStatus.in_progress.id
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    #current_order = Order.find(session[:order_id])
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attribute(:orderitems_quantity, order_item_params[:orderitems_quantity])



    # @order_item.update_attribute(:orderitems_quantity, order_item_params[:orderitems_quantity])
    redirect_to :mycart
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  private

  def order_item_params
    params.require(:order_item).permit(:orderitems_quantity, :product_id)
  end
end

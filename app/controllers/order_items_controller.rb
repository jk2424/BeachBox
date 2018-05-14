class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order.status = OrderStatus.in_progress.id    if params.key?("multiple_items")
      products = JSON.parse(params[:products])
      products.each do |product|
        existing_item = @order.order_items.find_by_product_id(product["product_id"])
        ot = existing_item ? existing_item : @order.order_items.new
        ot.orderitems_quantity = product["orderitems_quantity"]
        ot.product_id = product["product_id"]
        ot.save!
      end
    else
      @order_item = @order.order_items.new(order_item_params)
      @order.save
    end
    session[:order_id] = @order.id
    respond_to do |format|
      format.json { render json: { success: true } }
      format.html { redirect_to :mycart }
    end
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
    redirect_to cart_path
  end


#   def destroy
#   order = session['order']
#   item = order['items'].find { |item| item['product_id'] == params[:id] }
#   if item
#     cart['items'].delete item
#   end
#   redirect_to cart_path
# end

  private

  def order_item_params
    params.require(:order_item).permit(:orderitems_quantity, :product_id)
  end
end

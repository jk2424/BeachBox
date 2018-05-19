class DeliveriesController < ApplicationController

  def new
    @delivery = get_delivery(params[:street_address])
    current_order.update(street_address: params[:street_address])
    redirect_to mycart_path(fee: @delivery.fee)
  end

end

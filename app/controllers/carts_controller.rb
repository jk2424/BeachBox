class CartsController < ApplicationController

  def show
    @sub = current_order.subtotal * 100
    @order_items = current_order.order_items
    @order = current_order
    @amount = @sub/100.00 + params[:fee].to_i/100.00
    @fee = params[:fee].to_i
    current_order.update(tax: @fee.to_f)
    render :show, locals: {fee: @fee}
  end

  def create
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    render 'create'
  end


  private

  def deliver_params
    p params
    params.permit(:street_address)
  end

end

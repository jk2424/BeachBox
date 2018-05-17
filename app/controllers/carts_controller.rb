class CartsController < ApplicationController


  def new
    @amount = 1000 #current_order.subtotal * 100 #+ @quote.fee
  end


    def show
      @order_items = current_order.order_items
      @order = current_order

  end

  def create
    # Amount in cents
    # @amount =

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
    redirect_to new_charge_path
  end
end

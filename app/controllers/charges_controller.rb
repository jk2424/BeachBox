class ChargesController < ApplicationController
  FROM  = "1 washington avenue, Miami Beach, FL"

  def new
    @amount = current_order.subtotal * 100 #+ @quote.fee
    package = {
                :manifest => "a box of kittens",
                :pickup_name => "The Warehouse",
                :pickup_address => "1 Ocean Drive, Miami Beach, FL",
                :pickup_phone_number => "415-555-1234",
                # :pickup_business_name => "Optional Pickup Business Name, Inc.",
                :pickup_notes => "Optional note that this is Invoice #123",
                :dropoff_name => "Alice",
                :dropoff_address => "1 washington avenue, Miami Beach, FL, FL",
                :dropoff_phone_number => "415-555-1234", # params[:drop_phone]
                # :dropoff_business_name => "Optional Dropoff Business Name, Inc.",
                :dropoff_notes => "Optional note to ring the bell",
                # :quote_id => @quote.id #"dqt_K9LFfpSZCdAJsk"
              }

      @delivery = $client.create(package)

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

class ChargesController < ApplicationController
  def new
    from  = "549 NW 28th St, Miami, FL"
    to  = "1 Ocean Drive, Miami Beach, FL"
    @quote = $client.quote(pickup_address: from, dropoff_address: to)
    @amount = 1000

    # package = {
    #             :manifest => "a box of kittens",
    #             :pickup_name => "The Warehouse",
    #             :pickup_address => "20 McAllister St, San Francisco, CA",
    #             :pickup_phone_number => "555-555-5555",
    #             :pickup_business_name => "Optional Pickup Business Name, Inc.",
    #             :pickup_notes => "Optional note that this is Invoice #123",
    #             :dropoff_name => "Alice",
    #             :dropoff_address => "101 Market St, San Francisco, CA",
    #             :dropoff_phone_number => "415-555-1234",
    #             :dropoff_business_name => "Optional Dropoff Business Name, Inc.",
    #             :dropoff_notes => "Optional note to ring the bell",
    #             :quote_id => "dqt_K9LFfpSZCdAJsk"
    #           }
    #
    #   @delivery = $client.create(package)
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

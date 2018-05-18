class DeliveriesController < ApplicationController


  def new


    package = {
                :manifest => "a box of kittens",
                :pickup_name => "The Warehouse",
                :pickup_address => "1 washington avenue, Miami Beach, FL",
                :pickup_phone_number => "415-555-1234",
                # :pickup_business_name => "Optional Pickup Business Name, Inc.",
                :pickup_notes => "Optional note that this is Invoice #123",
                :dropoff_name => "Alice",
                :dropoff_address => params[:street_address],
                :dropoff_phone_number => "415-555-1234",
                # :dropoff_business_name => "Optional Dropoff Business Name, Inc.",
                :dropoff_notes => "Optional note to ring the bell",
                # :quote_id => @quote.id #"dqt_K9LFfpSZCdAJsk"
              }

    @delivery = $client.create(package)
    redirect_to mycart_path(fee: @delivery.fee)
  end
def create(params)
  #
  #
  #
  # @pin = delivery_params.street_address

end
end
# private
#
# def deliver_params
#   p params
#   params.permit(:street_address)

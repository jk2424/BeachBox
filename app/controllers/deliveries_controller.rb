class DeliveriesController < ApplicationController

  def new
    from  = "1 washington avenue, Miami Beach, FL"
    to  = "1 Ocean Drive, Miami Beach, FL"
    @quote = $client.quote(pickup_address: from, dropoff_address: to)

    from_lat = "37.778307"
    from_lon = "-122.413524"
    to_lat = "37.778307"
    to_lon = "-122.413524"
    @quote = $client.quote(pickup_latitude: from_lat, pickup_longitude: from_lon, dropoff_latitude: to_lat, dropoff_longitude: to_lon)

    package = {
                :manifest => "a box of kittens",
                :pickup_name => "The Warehouse",
                :pickup_address => "1 washington avenue, Miami Beach, FL",
                :pickup_phone_number => "415-555-1234",
                # :pickup_business_name => "Optional Pickup Business Name, Inc.",
                :pickup_notes => "Optional note that this is Invoice #123",
                :dropoff_name => "Alice",
                :dropoff_address => "1 Ocean Drive, Miami Beach, FL",
                :dropoff_phone_number => "415-555-1234",
                # :dropoff_business_name => "Optional Dropoff Business Name, Inc.",
                :dropoff_notes => "Optional note to ring the bell",
                # :quote_id => @quote.id #"dqt_K9LFfpSZCdAJsk"
              }

      @delivery = $client.create(package)
    render plain
  end

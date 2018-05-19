class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  helper_method :current_order

  def current_order
    unless session[:order_id].nil?
      Order.find(session[:order_id])
    else
      current_user.orders.create
    end
  end

  helper_method :current_user

  # Define the current_user method:
  def current_user
    # Look up the current user based on user_id in the session cookie:
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to login_path, alert: 'You must be logged in to access this page.' if current_user.nil?
  end

  def get_delivery(address)
    package = {
                :manifest => "a box of kittens",
                :pickup_name => "The Warehouse",
                :pickup_address => "1 washington avenue, Miami Beach, FL",
                :pickup_phone_number => "415-555-1234",
                # :pickup_business_name => "Optional Pickup Business Name, Inc.",
                :pickup_notes => "Optional note that this is Invoice #123",
                :dropoff_name => "Alice",
                :dropoff_address => address,
                :dropoff_phone_number => "415-555-1234",
                # :dropoff_business_name => "Optional Dropoff Business Name, Inc.",
                :dropoff_notes => "Optional note to ring the bell",
                # :quote_id => @quote.id #"dqt_K9LFfpSZCdAJsk"
              }

    $client.create(package)

  end

end

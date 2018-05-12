class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session
  


  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end


  # ----- add these lines here: -----

  # Make the current_user method available to views also, not just controllers:
  helper_method :current_user

  # Define the current_user method:
  def current_user
    # Look up the current user based on user_id in the session cookie:
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
    def authorize
      redirect_to login_path, alert: 'You must be logged in to access this page.' if current_user.nil?
    end

end

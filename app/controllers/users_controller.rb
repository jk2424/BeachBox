class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    puts user_params
    @user = User.new(user_params)
    puts @user
    @user.email.downcase!

    if @user.save
      flash[:notice] = "Account created successfully!"
      redirect_to login_path
    else
      flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
      render :new
    end
  end

  def home
  end

  def account_profile
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    puts @user
    if @user.update(user_params)
      redirect_to account_path
    else
      render :edit
    end
  end

private

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :phone_number, :email, :password, :password_confirmation)
  end
end

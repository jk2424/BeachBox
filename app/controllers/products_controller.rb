class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_param)

    if @product.save
      # If user saves in the db successfully:
      flash[:notice] = "Product created successfully!"
      redirect_to root_path
    else
      # If user fails model validation - probably a bad password or duplicate email:
      flash.now.alert = "Oops, couldn't create product. Please make sure you are using a valid email and password and try again."
      render :new
    end
  end
  private
  def product_param
    params.require(:product).permit(:product_name, :product_quantity, :product_weight, :product_dimension, :product_description, :product_image_url, :product_group, :product_price)
  end
end

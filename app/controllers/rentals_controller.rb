class RentalsController < ApplicationController

  def index
    @products = Product.all
    @rentals = current_user.rentals
    render :index
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def new
    @product = Product.new
      if @product.user != current_user
        @rental = Rental.new
        @product = Product.find(params[:product_id])
      else
        redirect_to @product, notice: 'No permition to rent.'
      end
  end

  def create
    @rental = Rental.new
    @rental.user = current_user
    @product = Product.find(params[:product_id])
    @rental.product = @product
    @product.available = false
    @product.save
    if @rental.save
      redirect_to new_product_charge_path(@product)
    else
      render :new
    end
  end

  def update
    @rental = Rental.find(params[:id])
    @rental.update(returned: true)

    redirect_to user_rentals_path
  end

  def return
    @product = Product.find(params[:product_id])
    @rental = @product.rentals.last
    @rental.returned = true
    @rental.save

    @product.available = true
    @product.save
    redirect_to product_rentals_path
  end

end

class RentalsController < ApplicationController
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
      redirect_to user_rentals_path, notice: 'Congrats! Your rental was succesful :)'
    else
      render :new
    end
  end

  def update
    @rental = Rental.find(params[:id])
    @rental.update(returned: true)
    redirect_to user_rentals_path
  end
end

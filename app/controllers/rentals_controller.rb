class RentalsController < ApplicationController
  def index
  @rentals = current_user.rentals
end

def show
  @rental = Rental.find(params[:id])
end

def new
  @rental = Rental.new
  @product = Product.find(params[:product_id])
end

def create
  @rental = Rental.new(rental_params)
  @rental.user = current_user
  @product = Product.find(:product_id)
  @rental.product = @product
  if @rental.save
    redirect_to rental_path, notice: 'Congrats! Your rental was succesful :)'
  else
    render :new
  end
end

private

  def rental_params
    params.require(:rental).permit(:begin, :end)
  end

end

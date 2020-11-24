class ProductsController < ApplicationController
before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index # list all clothes available to rent
    @products = Product.all
  end

  def show # select one product
  end

  def new # add new product
    @user = current_user
    @product = Product.new
  end

  def create
    @user = current_user
    @product = Product.new(product_params)
    @product.user = @user

    if @product.save
      redirect_to @product, notice: 'Successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update # edit a created product
    if @product.update(product_params)
      redirect_to @product, notice: 'Successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:category, :user_id, :status, :description, :price)
  end
end

class ProductsController < ApplicationController
before_action :set_product, only: [:show, :edit, :update, :destroy]
skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @products = Product.all.where(available: true)
  end

  def show
  end

  def new
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

  def update
    @product = Product.new(product_params)
    @product.user = @user
    if @product.user == current_user
      if @product.update(product_params)
        redirect_to @product, notice: 'Successfully updated.'
      else
        render :edit
      end
    else
      redirect_to @product, notice: 'No permition to edit.'
    end
  end

  def destroy
    if @product.user == current_user
      @product.destroy
      redirect_to products_path
    else
      redirect_to @product, notice: 'No permition to edit.'
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:category, :user_id, :description, :price, :photo)
  end
end

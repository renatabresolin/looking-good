class ClothesController < ApplicationController
before_action :set_cloth, only: [:show, :edit, :update, :destroy]

  def index # list all clothes available to rent
    @clothes = Cloth.all
  end

  def show # select one cloth
  end

  def new # add new cloth
    @user = current_user
    @cloth = Cloth.new
  end

  def create
    @user = current_user
    @cloth = Cloth.new(cloth_params)
    @cloth.user = @user

    if @cloth.save
      redirect_to @cloth, notice: 'Successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update # edit a created cloth
    if @cloth.update(cloth_params)
      redirect_to @cloth, notice: 'Successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @cloth.destroy
    redirect_to clothes_path
  end

  private

  def set_cloth
    @cloth = Cloth.find(params[:id])
  end

  def cloth_params
    params.require(:cloth).permit(:category, :user_id, :status)
  end
end

class ToiletsController < ApplicationController
  before_action :set_toilet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @toilets = Toilet.all
  end

  def new
    @toilet = Toilet.new
  end

  def create
    @toilet = Toilet.new(toilet_params)
    if @toilet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless current_user.id == @toilet.user_id
      redirect_to root_path
    end
  end

  def update
    if @toilet.update(toilet_params)
      redirect_to toilet_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @toilet.user_id
      @toilet.destroy 
      redirect_to root_path, notice: "Comleted to delete"
    else
      render :show, alert: "Failed to delete"
    end
  end


  private
  def toilet_params
    params.require(:toilet).permit(:name, :prefecture_id, :category_id, :condition_id, :number_id, :multi_id, :text, :address, :latitude, :longitude, images: []).merge(user_id: current_user.id)
  end

  def set_toilet
    @toilet = Toilet.find(params[:id])
  end
end

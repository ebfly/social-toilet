class ToiletsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
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

  private
  def toilet_params
    params.require(:toilet).permit(:name, :prefecture_id, :category_id, :condition_id, :number_id, :multi_id, :text, :image).merge(user_id: current_user.id)
  end

  def set_toilet
    @toilet = Toilet.find(params[:id])
  end
end

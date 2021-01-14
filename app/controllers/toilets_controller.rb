class ToiletsController < ApplicationController
  def index
  end

  private

  def message_params
    params.require(:toilet).permit(:name, :category_id, :condition_id, :number_id, :multi_id, :text, :image).merge(user_id: current_user.id)
  end
end

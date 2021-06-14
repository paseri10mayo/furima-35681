class OrdersController < ApplicationController

  def index
    @order_information = OrderInformation.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_information = OrderInformation.new(order_params)
    if @order_information.valid?
      @order_information.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_information).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone).merge(user_id: current_user.id)
  end
end
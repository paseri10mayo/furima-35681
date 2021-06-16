class OrdersInformationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order_information = OrderInformation.new
  end

  def create
    @order_information = OrderInformation.new(order_params)
    if @order_information.valid?
      pay_item
      @order_information.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_information).permit(:postal_code, :area_id, :city, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], order_id: order.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
    redirect_to root_path unless current_user.id == @item.user
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
 end
end
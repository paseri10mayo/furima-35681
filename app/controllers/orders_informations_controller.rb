class OrdersInformationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index, :create]

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
    params.require(:order_information).permit(:postal_code, :area_id, :city, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
 end

 def contributor_confirmation
  redirect_to root_path unless current_user.id != @item.user_id && @item.order == nil
  end
end
class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  # before_action :set_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  # def show
  #   @item = Item.find(params[:id])
  # end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :price, :categry_id, :condition_id, :charge_id, :area_id, :shipment_id ).merge(user_id:current_user.id)
  end

#   def set_item
#     @item = Item.find(params[:id])
#   end
end
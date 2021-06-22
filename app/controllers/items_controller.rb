class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update]
  before_action :search_item, only: [:index, :show, :search]

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
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments
  end

  def destroy
    if current_user.id == @item.user_id
       @item.destroy
      end
       redirect_to root_path
  end

  def search
    # @results = @q.result.includes(:name)  # 検索条件にマッチした商品の情報を取得
    @results = @q.result
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :price, :categry_id, :condition_id, :charge_id, :area_id, :shipment_id ).merge(user_id:current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user.id == @item.user_id && @item.order == nil
  end

  def search_item
    @q = Item.ransack(params[:q])  # 検索オブジェクトを生成
  end
end
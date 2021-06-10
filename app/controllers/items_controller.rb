class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :inst_item, only: [:show, :edit, :update, :destroy]
  before_action :same_user, only: [:edit, :update, :destroy]
  before_action :sold_out, only: [:edit, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
    @buy_log = BuyLog.all
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :delivery_cost_id, :delivery_day_id, :prefecture_id, :category_id, :status_id).merge(user_id: current_user.id)
  end

  def inst_item
    @item = Item.find(params[:id])
  end

  def same_user
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def sold_out
    unless @item.buy_log.blank?
      redirect_to root_path
    end
  end
end

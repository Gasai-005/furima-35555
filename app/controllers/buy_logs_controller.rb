class BuyLogsController < ApplicationController
  before_action :authenticate_user!
  before_action :inst_item
  before_action :sold_out
 
  def index
    @buy_delivery = BuyDelivery.new
  end
  
  def create
    @buy_delivery = BuyDelivery.new(buy_params)
    if @buy_delivery.valid?
      pay_item
      @buy_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  def buy_params
    params.require(:buy_delivery).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: buy_params[:token],
        currency: 'jpy'
      )
  end

  def inst_item
    @item = Item.find(params[:item_id])
  end

  def sold_out
    unless @item.buy_log.blank?
      redirect_to root_path
    end
  end
end

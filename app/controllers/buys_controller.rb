class BuysController < ApplicationController
  before_action :set_product, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]

  def index
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
  
  def pay_item
    Payjp.api_key = "sk_test_619343bebd1254f6f57d344d"
    Payjp::Charge.create(
      amount: @product[:price],
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

end

# #class BuysController < ApplicationController
#   def index
#     @buys = Buy.new
#     @product = Product.find(params[:product_id])
#   end

#   def create
#     @buy = Buy.create(buy_params)
#     Address.create(address_params)
#     redirect_to root_path
#   end

#   #private

#   def buy_params
#     params.permit(:name).merge(user_id: current_user.id)
#   end

#   def address_params
#     params.permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).marge(buy_id: @buy.id)
#   end

# end

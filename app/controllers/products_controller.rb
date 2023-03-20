
class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index, :create]

  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    unless current_user == @product.user && @product.buy == nil
      redirect_to action: :index
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    if current_user = product.user
      product.destroy
    end
    redirect_to  root_path
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :explanation, :category_id, :situation_id, :shipping_charge_id, :prefecture_id, :number_of_day_id, :price).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end

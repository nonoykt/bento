class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  def index
    @shops = Shop.all
  end

  def show
  end

  def new
    @shop = Shop.new
  end

  def edit
  end

  def create
    @shop = Shop.new(shop_params)

    if @shop.save
      redirect_to shop_url(@shop), notice: "ショップ「#{@shop.name}」を開店しました"
    else
      render :new
    end
  end

  def update
    if @shop.update
      redirect_to shop_url(@shop), notice: "ショップ「#{@shop.name}」を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @shop.destroy
    redirect_to root_url, notice: "ショップ「#{@shop.name}」を閉店しました"
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :email, :password, :password_confirmation)
  end

  def set_shop
    @shops = Shops.find(params[:id])
  end
end

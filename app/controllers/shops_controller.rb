class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  before_action :sign_in_required, only: [:edit, :new, :update, :destory]
  before_action :authenticate_shop!, only: [:edit, :new, :update, :destory]

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
      logger.debug "shop: #{@shop.attributes.inspect}"
      redirect_to shop_url(@shop.id), notice: "ショップ「#{@shop.name}」を開店しました"
    else
      render :new
    end
  end

  def update
    if @shop.update
      redirect_to shop_url(@shop.id), notice: "ショップ「#{@shop.name}」を更新しました"
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
    @shop = Shop.find(params[:id])
  end
end

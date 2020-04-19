class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      logger.debug "product: #{@product.attributes.inspect}"
      redirect_to product_url(@product.id), notice: "商品「#{@product.name}」が登録されました。"
    else
      render :new
    end
  end

  def update
    if @product.update
      redirct_to product_url(@product.id), notice: "商品「#{@product.name}」を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to shop_url(@shop), notice: "商品「#{@product.name}」を削除しました"
  end

  private

  def product_params
    params.require(:product).permit(:name, :description)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end

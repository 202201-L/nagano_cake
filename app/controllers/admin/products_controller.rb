class Admin::ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.genre_id = 1
    @product.save
    redirect_to admin_product_path(@product.id)
  end


  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_product_path(@product.id)
  end

  private

  def product_params
    params.require(:product).permit(:name, :body, :non_tax_price, :genre_id, :product_image, :sale_status)
  end

end

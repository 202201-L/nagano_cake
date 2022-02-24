class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end


  def index
    @products = Product.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
    @in_tax_price = @product.non_tax_price * 1.1
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_product_path(@product)
  end

  private

  def product_params
    params.require(:product).permit(:name, :body, :non_tax_price, :genre_id, :product_image, :sale_status)
  end

end

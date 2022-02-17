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
    if params[genre_id]
      @genre = Genre.find(params[:genre_id])
      @products = @genre.products
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  private

  def product_params
    params.require(:product).permit(:name, :body, :non_tax_price, :genre_id, :product_image)
  end

end

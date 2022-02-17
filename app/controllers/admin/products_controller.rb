class Admin::ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to product_path(@product.id)
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
    params.require(:product).permit(:name, :body, :non_tax_price, :sale_status, :image)
  end

end

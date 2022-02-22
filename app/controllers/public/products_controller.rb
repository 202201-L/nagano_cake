class Public::ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page])
    @genres = Genre.all
  end

  def show
    @cart_item = CartItem.new
    @product = Product.find(params[:id])
    @genres = Genre.all
    @in_tax_price = @product.non_tax_price * 1.1
  end
end

class Public::CartItemsController < ApplicationController
  before_action :authenticate_end_user!

  def index
    @cart_items = current_end_user.cart_items.all
    @total_price = @cart_items.inject(0) {|sum, product| sum + product.sub_total }
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.end_user_id = current_end_user.id
    if @cart_item.save
      redirect_to cart_items_path, notice: "カートに追加されました"
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_back(fallback_location: root_path)
  end

  def destroy_all
    CartItem.destroy_all
    redirect_back(fallback_location: root_path)
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:end_user_id, :product_id, :amount)
  end

end
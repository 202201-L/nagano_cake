class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_end_user.cart_items.all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.end_user_id = current_end_user.id
    @cart_item.save
    redirect_to cart_items_path
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


  private

  def cart_item_params
    params.require(:cart_item).permit(:end_user_id, :product_id, :amount)
  end

end
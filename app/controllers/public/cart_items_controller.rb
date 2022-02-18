class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_end_user.cart_items
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
    @end_user = EndUser.find(current_user.id)
    @cart_items = current_user.cart_items
    redirect_to cart_items_path
  end




  private

  def cart_item_params
    params.permit(:end_user_id, :product_id, :amount)
  end

end
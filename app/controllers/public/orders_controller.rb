class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create

  end

  def confirm
    @cart_items = current_end_user.cart_items
    @order = Order.new(order_params)
    @order.postage = 800

  end

  def index

  end

  def show

  end

  def complete

  end

  private
    def   order_params
    params.require(:order).permit(:name, :address, :total_price, :postage, :payment_method)
    end


end

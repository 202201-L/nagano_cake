class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create

  end

  def create
  cart_items = current_customer.cart_items.all

  @order = current_end_user.orders.new(order_params)
  if @order.save
    cart_items.each do |cart|
      order_detail = OrderDetail.new
      order_detail.product_id = cart.item_id
      order_product.order_id = @order.id
      order_detail.order_amount = cart.amount
      order_detail.order_price = cart.item.price
      order_detail.save
    end
    redirect_to orders_complete
    cart_items.destroy_all
  else
    render :new
  end
  end


  def confirm
    @cart_items = current_end_user.cart_items
    @order = Order.new(order_params)
    @order.postage = 800
    @total = @cart_items.inject(0) { |sum, item| sum + item.sub_total }

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

    def delivery_params
    params.require(:order).permit(:name, :address)
    end


end

class Public::OrdersController < ApplicationController

  def new
    @order = Order.new

  end

  def create
  cart_items = current_end_user.cart_items.all

  @order = current_end_user.orders.new(order_params)
  if @order.save!
    cart_items.each do |cart|
      order_detail = OrderDetail.new
      order_detail.product_id = cart.product_id
      order_detail.order_id = @order.id
      order_detail.amount = cart.amount
      order_detail.intax_price = cart.product.in_tax_price
      order_detail.save
    end
    redirect_to orders_complete_path
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
    @total_price = @order.postage + @total

    if params[:order][:address_number] == "1"
      @order.post_code = current_end_user.post_code
      @order.address = current_end_user.address
      @order.name = current_end_user.last_name + current_end_user.first_name

    elsif params[:order][:address_number] == "2"
      delivery = Delivery.find(params[:order][:delivery_id])
      @order.post_code = delivery.post_code
      @order.address = delivery.address
      @order.name = delivery.address_name
    end




  end

  def index

     @orders_all = Order.page(params[:page])
     @orders = current_end_user.orders.order(created_at: :desc)



  end

  def show

    @order = Order.find(params[:id])
    @order.postage =800
    @order_detail = @order.order_details.all
    @total = @order_detail.inject(0) { |sum, item| sum + item.sub_total }
    @total_price = @order.postage + @total
  end


  def complete

  end

  private
    def   order_params
    params.require(:order).permit(:name, :address, :total_price, :postage, :payment_method,:post_code)
    end
end

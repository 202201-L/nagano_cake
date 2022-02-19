class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page])
  end
  def show
    @order = Order.find(params[:id])
    @end_user = @order.end_user
  end
  def update
    @order  =  
  

  def order_params
    params.require(:order).permit(:address, :created_at, :payment_method, :order_statuss)
  end
end

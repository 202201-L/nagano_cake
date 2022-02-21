class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order.postage = 800
    @order_details = @order.order_details
    @total = @order_details.inject(0) { |sum, item| sum + item.sub_total }
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details
    if @order.order_status == "入金確認"
      @order_details.each do |order_detail|
        order_detail.update(production_status: 1)
      end
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end

class Public::DeliveriesController < ApplicationController
  before_action :authenticate_end_user!

  def index
    @deliveries = Delivery.all
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.end_user_id = current_end_user.id
    @delivery.save
    # redirect_back(fallback_location: root_path)
    redirect_to deliveries_path
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    @delivery.update(delivery_params)
    redirect_to deliveries_path
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to deliveries_path
  end


  private

  def delivery_params
    params.require(:delivery).permit(:address_name, :address, :post_code)
  end
end

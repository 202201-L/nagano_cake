class Public::DeliveriesController < ApplicationController
  before_action :authenticate_end_user!

  def index
    @delivery = Delivery.new
    @deliveries = current_end_user.deliveries
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.end_user_id = current_end_user.id
    if @delivery.save
      redirect_to deliveries_path
    else
      @deliveries = current_end_user.deliveries
      render "index"
    end
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to deliveries_path
    else
      render "edit"
    end
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

class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @end_users = EndUser.page(params[:page])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      redirect_to admin_end_user_path(@end_user)
    else
      render "edit"
    end
  end

  def withdraw
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def end_user_params
    params.require(:end_user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :address, :is_delete, :tel, :email)
  end
end

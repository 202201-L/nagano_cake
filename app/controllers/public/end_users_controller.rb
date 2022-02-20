class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!

  def show
    @end_user = EndUser.find(params[:id])
  end
  def edit
    @end_user = EndUser.find(params[:id])
  end
  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      redirect_to end_user_path(@end_user)
    else
      render "edit"
    end
  end
  def end_user_params
    params.require(:end_user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :email, :address, :tel)
  end
end

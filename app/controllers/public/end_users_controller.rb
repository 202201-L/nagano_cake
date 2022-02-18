class Public::EndUsersController < ApplicationController
  def show
    @end_user = EndUser.find(params[:id])
  end
  def end_user_params
    params.require(:end_user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code,:address)
  end
end

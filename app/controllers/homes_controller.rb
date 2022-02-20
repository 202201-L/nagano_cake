class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @products = Product.all.order(created_at: :desc).limit(4)
  end

  def about

  end

  def unsubscribe
    @end_user = EndUser.find_by(params[:id])
  end

  def withdraw
    @end_user = current_end_user
    @end_user.update(is_delete: true)
    reset_session
    redirect_to root_path
  end

end

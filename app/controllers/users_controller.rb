class UsersController < ApplicationController
  def show
    user = User.order("id DESC").find(current_user[:id])
    @comments = user.comments.all.page(params[:page]).per(10)
  end
end

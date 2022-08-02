class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    redirect_to root_path if current_user.nil? || current_user.id != @user.id
  end
end

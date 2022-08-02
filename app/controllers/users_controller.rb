class UsersController < ApplicationController

  def show
		@user = User.find(params[:id])
		if current_user==nil || current_user.id != @user.id
			redirect_to root_path
	   end
   end



end

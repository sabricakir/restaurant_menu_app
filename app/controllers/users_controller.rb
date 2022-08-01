class UsersController < ApplicationController

  def show
		@user = User.find(params[:id])
		if current_user.id != @user.id
			#function
	   end
   end



end

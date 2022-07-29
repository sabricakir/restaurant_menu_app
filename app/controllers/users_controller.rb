class UsersController < ApplicationController
  def show
		@user = User.find(params[:id])
		if current_user.id != @user.id
			#function
	   end
   end

   private

   def user_params
     params.require(:user).permit(:email,:password,:name,:surname,:phone,:avatar)
   end
end

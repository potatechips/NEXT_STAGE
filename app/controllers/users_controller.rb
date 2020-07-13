class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def index
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
	    if  User.update(user_params)
	    	flash[:notice] = "successfully update user!"
		    redirect_to user_path(@user.id)
		else
			render :edit
		end
	end

	private
	def user_params
		params.require(:user).permit(:name,:email,:introduction,:profile_image)
	end

end

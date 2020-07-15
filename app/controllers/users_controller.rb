class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
	end

	def index
		@users = User.page(params[:page]).per(8)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
	    if  @user.update(user_params)
	    	flash[:notice] = "successfully update user!"
		    redirect_to user_path(@user.id)
		else
			render :edit
		end
	end

	# ==============user,usersで呼ぶデータを定義する、userは同じ================
	def follows
	    user = User.find(params[:id])
	    @users = user.followings
	end

	def followers
	    user = User.find(params[:id])
	    @users = user.followers
	end
# ==============↑usersで一覧表示したいデータの区別を行う================

	private
	def user_params
		params.require(:user).permit(:name,:email,:introduction,:profile_image)
	end

end

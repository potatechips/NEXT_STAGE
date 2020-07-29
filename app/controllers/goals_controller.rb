class GoalsController < ApplicationController
	before_action :authenticate_user!

	def show
		@goal_new = Goal.new
		@goal = Goal.find(params[:id])
		@user = @goal.user

		@goal_comments = GoalComment.all
		@goal_comment = GoalComment.new
	end

	def index
		@goals = Goal.page(params[:page]).per(8)
		@goal_new = Goal.new
		@user = current_user
	end

	def create
		@goal_new = Goal.new(goal_params)
		@goal_new.user_id = current_user.id
	    if @goal_new.save
		   flash[:notice] = "successfully created goal!"
		   redirect_to goal_path(@goal_new.id)
		else
		   @goals = Goal.page(params[:page]).per(8)
		   @user = current_user
		   render :index
		end
	end

	def edit
		@goal_new = Goal.new
		@goal = Goal.find(params[:id])
		@user = current_user
	end

	def update
		@goal = Goal.find(params[:id])
		if  @goal.update(goal_params)
			flash[:notice] = "successfully updated goal!"
		    redirect_to goal_path(@goal.id)
		else
		    render :edit
		end
	end

	def destroy
		goal = Goal.find(params[:id])
		goal.destroy
		redirect_to user_path(current_user.id),notice: "successfully delete goal!"
	end

	private
	def goal_params
		params.require(:goal).permit(:content,:task,:user_id,:term_at)
	end

end

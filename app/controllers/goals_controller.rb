class GoalsController < ApplicationController
	before_action :authenticate_user!

	def new
		@goal = Goal.new
	end

	def show
		@goal = Goal.find(params[:id])
		@user = @goal.user
	end

	def index
		@goals = Goal.all
	end

	def create
		@goal = Goal.new(goal_params)
		@goal.user_id = current_user.id
		if  @goal.save
			flash[:notice] = "successfully created goal!"
			redirect_back(fallback_location: root_path)
		else
			render :new
		end
	end

	def edit
		@goal = Goal.find(params[:id])
	end

	def update
		@goal = Goal.find(params[:id])
		if  @goal.update(goal_params)
			flash[:notice] = "successfully updated goal!"
		    redirect_to goal_path(@goal)
		else
		    render :edit
		end
	end

	def destroy
		goal = Goal.find(params[:id])
		goal.destroy
		redirect_to goals_path,notice: "successfully delete goal!"
	end

	private
	def goal_params
		params.require(:goal).permit(:content,:task,:user_id,:term_at)
	end

end

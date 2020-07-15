class GoalsController < ApplicationController

	def new
		@goal = Goal.new
	end

	def show
	end

	def index
	end

	def create
		@goal = Goal.new(goal_params)
		@goal.user_id = current_user.user_id
		if  @goal.save
			flash[:notice] = "successfully created goal!"
			redirect_to goal_path(@goal)
		else
			render :new
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def goal_params
		params.require(:goal).permit(:content,:task,:user_id,:term_at)
	end

end

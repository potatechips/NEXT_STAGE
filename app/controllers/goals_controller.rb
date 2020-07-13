class GoalsController < ApplicationController

	def new
	end

	def show
	end

	def index
	end

	def create
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

class RankingsController < ApplicationController

	def index
		@goal_new = Goal.new
		@all_ranks = Goal.find(Favorite.group(:goal_id).order("count(goal_id) desc").limit(5).pluck(:goal_id))
	end


end

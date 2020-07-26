class RankingsController < ApplicationController

	def index
		@goal_new = Goal.new
		@all_ranks = Goal.find(Favorite.group(:goal_id).order(Arel.sql("count(goal_id) desc")).limit(5).pluck(:goal_id))
		@all_rankings = User.joins(:passive_relationships).group(:follower_id).order(Arel.sql('count(relationships.follower_id) desc')).limit(5)
	end

end

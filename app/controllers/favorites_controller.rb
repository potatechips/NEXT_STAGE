class FavoritesController < ApplicationController

  def create
	  goal = Goal.find(params[:goal_id])
	  favorite = current_user.favorites.new(goal_id: goal.id)
	  favorite.save
	  redirect_back(fallback_location: root_path)
  end
  def destroy
	  goal = Goal.find(params[:goal_id])
	  favorite = current_user.favorites.find_by(goal_id: goal.id)
	  favorite.destroy
	  redirect_back(fallback_location: root_path)
  end

end

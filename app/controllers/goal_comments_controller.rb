class GoalCommentsController < ApplicationController

	def create
		goal = Goal.find(params[:goal_id])
		comment = GoalComment.new(goal_comment_params)
		comment.user_id = current_user.id
		comment.goal_id = goal.id

		comment.save
		redirect_back(fallback_location: root_path)
	end
	def destroy
		# goal_comment = GoalComment.find_by(id:params[:id],goal_id:params[:goal_id])
		goal_comment = GoalComment.find(params[:id])
		goal_comment.destroy
		redirect_back(fallback_location: root_path)
	end

	private
	def goal_comment_params
		params.require(:goal_comment).permit(:comment,:user_id,:goal_id)
	end

end

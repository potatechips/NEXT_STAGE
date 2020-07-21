class SearchController < ApplicationController

	def search
        @goal = Goal.new

		 #  とりあえず
		if params[:word].present? && params[:model] === "Goal" && params[:search] === "perfect"
			@goals = Goal.where('content LIKE ?', "#{params[:word]}") 
			# 完全一致

		elsif params[:word].present? && params[:model] === "Goal" && params[:search] === "front"
			@goals = Goal.where('content LIKE ?', "#{params[:word]}%")
			# 前方一致

		elsif params[:word].present? && params[:model] === "Goal" && params[:search] === "back"
			@goals = Goal.where('content LIKE ?', "%#{params[:word]}")
			# 後方一致

		elsif params[:word].present? && params[:model] === "Goal" && params[:search] === "part"
			@goals = Goal.where('content LIKE ?', "%#{params[:word]}%")
			# 部分一致
		else
         # @goals = Goal.none
		end

		 # user
		if params[:word].present? && params[:model] === "User" && params[:search] === "perfect"
			@users = User.where('name LIKE ?', "#{params[:word]}")
			# 完全一致

		elsif params[:word].present? && params[:model] === "User" && params[:search] === "front"
			@users = User.where('name LIKE ?', "#{params[:word]}%")
			# 前方一致

		elsif params[:word].present? && params[:model] === "User" && params[:search] === "back"
			@users = User.where('name LIKE ?', "%#{params[:word]}")
			# 後方一致

		elsif params[:word].present? && params[:model] === "User" && params[:search] === "part"
			@users = User.where('name LIKE ?', "%#{params[:word]}%")
			# 部分一致
		else
         # @users = User.none
        end

    end
end

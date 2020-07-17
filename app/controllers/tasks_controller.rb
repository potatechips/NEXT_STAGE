class TasksController < ApplicationController

	def create
        # 画面からわたってきたIDからprojectをfindする
        @goal = Goal.find(params[:goal_id])
        # taskを登録
        @task    = @goal.tasks.create(tasks_params)
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to goals_path
    end
    private
    def tasks_params
      # taskでわたってきたもののうち、titleだけ使用
        params[:task].permit(:title)
    end
end

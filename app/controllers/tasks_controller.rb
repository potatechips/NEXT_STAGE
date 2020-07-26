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
        redirect_back(fallback_location: root_path)
    end

        # toggleアクションを追加
    def toggle
        render nothing: true
        @task      = Task.find(params[:id])
        # タスクのdoneの値をひっくり返す
        @task.done = !@task.done
        @task.save
        # 下記でもいいけど、render nothing: true でOKなので、下記はコメントアウト
        # redirect_to goal_path(params[:goal_id])
    end
    private
    def tasks_params
      # taskでわたってきたもののうち、titleだけ使用
        params[:task].permit(:title)
    end
end

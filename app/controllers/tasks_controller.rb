class TasksController < ApplicationController
	def create
		@task = Task.new(task_params)
		@task.project_id = params[:project_id]
		@task.save

		redirect_to project_path(@task.project)
	end

	def task_params
		params.require(:task).permit(:name, :status, :deadline)
	end	
end

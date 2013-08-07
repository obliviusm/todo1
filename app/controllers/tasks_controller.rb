class TasksController < ApplicationController
	def create
		@task = Task.new(task_params)
		@task.project_id = params[:project_id]
		@task.save

		redirect_to project_path(@task.project)
	end

	def index

	end

	def show

	end

	def new

	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy

		format.js
	new

	def edit

	new

	def update

	new

	def task_params
		params.require(:task).permit(:name, :status, :deadline)
	end	
end

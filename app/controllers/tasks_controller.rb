class TasksController < ApplicationController

	def create
		@task = Task.new
		@task.name = params[:name]

		@project = Project.find(params[:project_id])

		respond_to do |format|
			format.html { redirect_to project_path(@project) }
			format.js
		end
	end

	def new
		@task = Task.new
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy

		format.js
	end

	def edit
		@task = Task.find(params[:id])
		@project = Project.find(params[:project_id])

		respond_to do |format|
			format.html 
			format.js
		end
	end

	def update
		@task = Task.find(params[:id])
		@task.update(task_params)

		@project = Project.find(params[:project_id])

		respond_to do |format|
			format.html { redirect_to project_path(@project) }
			format.js
		end
	end

	def task_params
		params.require(:task).permit(:name, :status, :deadline, :project_id)
	end
end

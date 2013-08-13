class TasksController < ApplicationController

	def create
		@task = Task.new(task_params)
		@task.project_id = params[:project_id]
    @task.save

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

    respond_to do |format|
      format.html
      format.js
    end
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
		@task1 = Task.find(params[:id])
		@task1.update(task_params)

		@project = Project.find(params[:project_id])
    @task = @project.tasks.new

		respond_to do |format|
			format.html { redirect_to project_path(@project) }
			format.js
		end
	end

	def task_params
		params.require(:task).permit(:name, :status, :deadline)
	end
end

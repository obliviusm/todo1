class ProjectsController < ApplicationController
	def index
	  	@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
		@task = Task.new
		@task.project_id = @project.id
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		@project.save

		redirect_to project_path(@project)
	end

	def destroy
		@project  = Project.find(params[:id])
		@project.destroy

		respond_to do |format|
			format.html { redirect_to projects_path}
			format.js
		end
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		@project.update(project_params)

		 flash.notice = "Project '#{@project.name}' Updated!"

		redirect_to project_path(@project)
	end

	def project_params
    	params.require(:project).permit(:name)
  	end
end

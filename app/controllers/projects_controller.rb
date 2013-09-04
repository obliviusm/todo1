class ProjectsController < ApplicationController
  before_action :signed_in_user

	def index
      @projects = current_user.projects.all
	  	#@projects = Project.all
	  	#@project = Project.new
      #@task = Task.new
	end

	def show
		@project = Project.find(params[:id])
		@task = Task.new
		@task.project_id = @project.id
	end

	def new
		@project = current_user.projects.new
	end

	def create
		@project = current_user.projects.new
    @project.name = 'New TODO List'
		@project.save
		respond_to do |format|
			format.html { redirect_to project_path(@project) }
			format.js
		end
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

		respond_to do |format|
			format.html
			format.js
		end
	end

	def update
		@project = Project.find(params[:id])
		@project.update(project_params)

		respond_to do |format|
			format.html { redirect_to project_path(@project) }
			format.js
		end
	end

	def project_params
    	params.require(:project).permit(:name)
  	end
end

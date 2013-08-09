class TasksController < ApplicationController

	def destroy
		@task = Task.find(params[:id])
		@task.destroy

		format.js
	end

	def edit
		@task = Task.find(params[:id])

		#format.js
	end
end

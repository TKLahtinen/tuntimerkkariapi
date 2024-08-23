class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project
    before_action :set_task, only: [:show, :update, :destroy]

    # get all tasks
    def index
        tasks = @project.tasks
        render json: tasks
    end

    # get a specific task
    def show
        render json: @task
    end

    # create a new task
    def create
        @task = @project.tasks.new(task_params)
        if @task.save
            render json: @task, status: :created
        else
            render json: @task.errors, status: :unprocessable_entity
        end
    end

    # update a task
    def update
        if @task.update(task_params)
            render json: @task
        else
            render json: @task.errors, status: :unprocessable_entity
        end
    end

    # delete a task
    def destroy
        @task.destroy
        render json: { status: 'Task has been deleted' }
    end

    private

    def set_project
        @project = Project.find(params[:project_id])
    end

    def set_task
        @task = @project.tasks.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:name, :start_date, :status)
    end

end

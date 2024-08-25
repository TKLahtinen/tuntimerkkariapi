class MarksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_task
    before_action :set_mark, only: [:show, :update, :destroy]

    # get all marks /tasks/:task_id/marks
    def index
        marks = @task.marks
        render json: MarkSerializer.new(marks).serializable_hash.to_json
    end

    # get a specific mark /tasks/:task_id/marks/:id
    def show
        mark = @task.marks.find(params[:id])
        render json: MarkSerializer.new(mark).serializable_hash.to_json
    end

    # create a new mark /tasks/:task_id/marks
    def create
        @mark = @task.marks.new(mark_params)
        @mark.user = current_user
        if @mark.save
            render json: @mark, status: :created
        else
            render json: @mark.errors, status: :unprocessable_entity
        end
    end

    # update a mark /tasks/:task_id/marks/:id
    def update
        if @mark.update(mark_params)
            render json: @mark
        else
            render json: @mark.errors, status: :unprocessable_entity
        end
    end

    # delete a mark /tasks/:task_id/marks/:id
    def destroy
        @mark.destroy
        render json: { status: 'Mark has been deleted' }
    end

    private

    def set_task
        @task = Task.find(params[:task_id])
    end

    def set_mark
        @mark = @task.marks.find(params[:id])
    end

    def mark_params
        params.require(:mark).permit(:h_amount, :date)
    end


end

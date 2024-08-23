class ProjectsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin, only: [:create, :update, :destroy]

    # get all projects

    def index
        projects = Project.all
        render json: ProjectSerializer.new(projects).serializable_hash.to_json
    end

    # create a new project

    def create
        project = Project.new(project_params)
        if project.save
            render json: project
        else
            render json: project.errors
        end
    end

    # update a project

    def update
        project = Project.find(params[:id])
        if project.update(project_params)
            render json: project
        else
            render json: project.errors
        end
    end

    # delete a project

    def destroy
        project = Project.find(params[:id])
        project.destroy
        render json: { status: 'Project has been deleted' }
    end

    private

    def authorize_admin
        unless current_user.admin?
            render json: { error: 'Only admins can perform this action' }, status: :unauthorized
        end
    end

    def project_params
        params.require(:project).permit(:name, :start_date, :status)
    end

end

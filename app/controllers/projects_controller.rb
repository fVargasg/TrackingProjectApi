class ProjectsController < ProtectedController
  before_action :set_project, only: %i[update destroy]

  def index
    @projects = current_user.projects.all

    render json: @projects
  end
  def show
    @project = current_user.projects.find(params[:id])
    render json: @project
  end
  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      render json: @project, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end
  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end
  def destroy
    current_user.projects.find(params[:id]).destroy

    head :no_content
  end
  def set_project
    @project = current_user.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :status)
  end

  private :set_project, :project_params
end

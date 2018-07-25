class StoriesController < ProtectedController
  before_action :set_story, :set_project, only: %i[update destroy]

  def index
    #current_user.projects.find(3).stories.all
    @stories = Story.all

    render json: @stories
  end

  def show
    render json: current_user.projects.find(params[:id]).stories.all
  end
  def create
    @story = Story.new(story_params)

    if @story.save
      render json: @story, status: :created
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end
  def update
    if @story.update(story_params)
      render json: @story
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end
  def set_project
    @project = current_user.projects.find(params[:id])
  end
  def set_story
    @project = current_user.projects.find(3)
    @story = @project.stories.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:name, :description, :typestory, :difficulty, :project_id)
  end

  private :set_story, :set_project, :story_params
end

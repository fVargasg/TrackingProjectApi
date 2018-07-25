class TasksController < ProtectedController
  #before_action only: %i[update destroy]

  def index
    @tasks = Task.all

    render json: @tasks
  end

  def show
    render json: Story.find(params[:id]).tasks.all
  end
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end
  def task_params
    params.require(:task).permit(:name, :story_id)
  end

  private :task_params
end

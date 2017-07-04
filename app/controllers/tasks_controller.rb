class TasksController < ApplicationController
  def index
    @tasks = Task.all 
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new
    @task = Task.create(task_params)

    if @task.save
      redirect_to tasks_path, :notice => "Your Task is successfully created"
    else
      render new
    end
      
  end

  def edit
  end

  def update

  end  

  def show
  end

  def task_params
    params.require(:task).permit!
   end 
end

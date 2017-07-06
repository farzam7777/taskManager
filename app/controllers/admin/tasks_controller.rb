class Admin::TasksController < ApplicationController
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
      redirect_to admin_tasks_path, :notice => "Your Task is successfully created. "
    else
      render new
    end
      
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to admin_task_path, :notice => "Your task is successfully Updated. "
    else
      render edit
    end    
  end  

  def show
    @task = Task.find(params[:id])
  end

  def completed
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to admin_tasks_path, :notice => "Your task is successfully Deleted. "
    else
      redirect_to admin_tasks_path, :notice => "Your task is not successfully Deleted. "
     end 
  end  

  def task_params
    params.require(:task).permit!
   end 
end

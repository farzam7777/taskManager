class CommentsController < ApplicationController
  
  def index
  end

  def new
  end

  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build(comment_params)
    if @comment.save
      redirect_to @task, notice: "Your Comment is successfully created. "
    else
      render @task
    end    
  end  

  def edit
    @task = Task.find(params[:task_id])
    @comment = @task.comments.find(params[:id])
  end

  def update
    @task = Task.find(params[:task_id])
    @comment = @task.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @task, notice: "Your comment is updated. "
    else 
      redirect_to @task
    end    
  end  

  def show
  end

  def destroy
    @task = Task.find(params[:task_id])
    @comment = @task.comments.find(params[:id])
    
    if @comment.destroy
      redirect_to @task, notice: "Your comment is Deleted. "
    else 
      redirect_to @task
    end 

  end  

  def comment_params
    params.require(:comment).permit!
   end 

end

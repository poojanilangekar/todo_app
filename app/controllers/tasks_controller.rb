class TasksController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :complete]
  
  def index
  end

  def create
    @task = current_user.tasks.build(task_params)
      if @task.save
        flash[:success] = "Task has been added!"
        redirect_to root_url
      else
        render 'static_pages/home'
      end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_url
  end

  def complete
    task_id = params[:task_id]
    @task = Task.find_by_id(task_id)
    @task.update_attribute(:completed, !@task.completed)
  end

private 
  
  def task_params
    params.require(:task).permit(:content, :completed, :todolist_id, :completeby)
  end 

end

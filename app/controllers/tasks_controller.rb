class TasksController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  
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
    params[:tasks_checkbox].each do |check|
       task_id = check
       t = Task.find_by_id(task_id)
       t.update_attribute(:completed, true)
     end
    redirect_to root_url
 end
  private 
    def task_params
      params.require(:task).permit(:content, :completed)
    end 

end

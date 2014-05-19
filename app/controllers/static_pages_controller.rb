class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @task = current_user.tasks.build 
      @task_items = current_user.tasks
    end
  end
  def about
  end
end

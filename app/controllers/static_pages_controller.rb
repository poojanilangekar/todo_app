class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @task_items = current_user.tasks
      @task = Task.new
      @todolist_items = current_user.todolists
      @todolist = Todolist.new
    end
  end
  def about
  end
end

class StaticPagesController < ApplicationController
  def home
    @task = current_user.tasks.build if signed_in?
  end
  def about
  end
end

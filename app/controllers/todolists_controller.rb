class TodolistsController < ApplicationController
  before_filter :signed_in_user

  def create
    @todolist = current_user.todolists.build(todolists_params)
    if @todolist.save
      flash[:success] = "Todolist created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end 
  
  def destroy
  end

private 
  def todolists_params
    params.require(:todolist).permit(:name,:user_id)
  end

end


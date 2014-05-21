class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:index, :edit, :update, :change_password]
  before_filter :correct_user,   only: [:edit, :update, :change_password]
  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks.paginate(page: params[:page], per_page: 5)
    @todolists = @user.todolists.paginate(page: params[:page], per_page: 5)
  end  
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the TODO App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def index
    @users = User.all
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attribute(:name, user_params[:name]) and @user.update_attribute(:email, user_params[:email])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def change_password
    @user = current_user
    if request.post?
      @user.password = params[:user][:password]
      @user.password_confirmation = params[:user][:password_confirmation]
      if @user.changed? && @user.save
        flash[:success] = "Password updated!"
        redirect_to @user
      else
        render :action => "change_password"
      end
    end
  end
private
  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end

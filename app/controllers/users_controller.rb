class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, :notice => "User was successfully created."
    else
      redirect_to new_user_path, :notice => "User was not successfully created."
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      redirect_to root_path, :notice => "User was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, :notice => "User was successfully deleted."
  end

  private

  def users_params
    params.require(:user).permit(:user_name, :password, :about)
  end

end

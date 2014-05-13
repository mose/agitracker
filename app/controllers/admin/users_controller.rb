class Admin::UsersController < ApplicationController

  load_and_authorize_resource

  before_filter :get_user_from_id, only: [ :show, :edit, :update, :destroy ]
  before_filter :authenticate_user!


  def index
    @users = User.all
    @title = "Users list"
  end

  def show
    @title = "Show " + @user.name
  end

  def new
    @user = User.new
    @title = "New user"
  end

  def create
    User.create(user_params)
    flash[:success] = "ok, saved."
    redirect_to admin_users_path
  end

  def edit
    @title = "Edit " + @user.name
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ok, saved."
      redirect_to admin_user_path @user
    else
      flash[:failure] = "failed to save"
      render :edit, id: @user.id
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "ok, destroyed."
    redirect_to admin_users_path
  end


  private

  def get_user_from_id
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :email, :password)
  end

end

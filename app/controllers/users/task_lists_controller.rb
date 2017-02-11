class Users::TaskListsController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @task_lists = TaskList.from_user(params[:user_id])
  end

  def create
    TaskList.create(params[:task_list].permit!)
    redirect_to user_task_lists_path(params[:user_id])
  end

  def update
    task_list = TaskList.find(params[:id])
    task_list.update_attributes(params[:task_list].permit!)
    redirect_to user_task_lists_path(params[:user_id])
  end

  def new
    @task_list = TaskList.new
  end

  def edit; end

  def destroy
    @id = params[:id]
    TaskList.destroy(@id)
  end

  def toggle_bookmark
    task_list = TaskList.find(params[:id])
    task_list.toggle_bookmark_for(params[:user_id])
    redirect_to user_task_lists_path(params[:user_id])
  end


end
class Users::TaskListsController < ApplicationController
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
    respond_to do |format|
      format.html { redirect_to user_task_lists_path(params[:user_id]) }
      format.json { render task_list.to_json }
    end

  end

  def new
    @task_list = TaskList.new
  end

  def edit
  end

  def destroy
    @id = params[:id]
    TaskList.destroy(@id)
  end
end
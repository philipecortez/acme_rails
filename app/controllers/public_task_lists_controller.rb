class PublicTaskListsController < ApplicationController
  before_action :authenticate_user!
  def index
    @task_lists = TaskList.publics
  end

  def show
    @task_list = TaskList.find(params[:id])
  end

  def toggle_bookmark
    task_list = TaskList.find(params[:id])
    task_list.toggle_bookmark_for(current_user.id)
    redirect_to public_task_lists_path
  end
end
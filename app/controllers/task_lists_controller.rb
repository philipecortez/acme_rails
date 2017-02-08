class TaskListsController < ApplicationController
  
  def index
    @task_lists = TaskList.publics
  end

  def show
    @task_list = TaskList.find(params[:id])
  end
end
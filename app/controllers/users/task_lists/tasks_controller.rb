class Users::TaskLists::TasksController < ApplicationController
  def index
    @task_list = TaskList.find(params[:task_list_id])
    @tasks = @task_list.tasks.sort
    @task = Task.new
  end

  def create
    @task = Task.create(params[:task].permit!)
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes!(params[:task].permit!)
    render json: @task
  end

  def destroy
    @id = params[:id]
    Task.find(@id).destroy
  end
end
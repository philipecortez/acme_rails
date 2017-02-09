class Users::TaskLists::TasksController < ApplicationController
  def index
    @task_list = TaskList.find(params[:task_list_id])
    @tasks = @task_list.tasks
    @task = Task.new
  end

  def create
    binding.pry
    @task = Task.create(params[:task].permit!)
  end

  def update
  end

  def destroy
  end
end
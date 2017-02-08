class Users::TaskListsController < ApplicationController
  def index
    binding.pry
    @task_lists = TaskList.from_user(params[:user_id])
  end

  def create
  end

  def update
  end

  def new
  end

  def edit
  end

  def destroy
  end
end
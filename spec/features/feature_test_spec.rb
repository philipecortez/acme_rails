# 3 Logo após criar uma lista, o usuário poderá adicionar várias tarefas consecutivamente via AJAX
require "rails_helper"

describe "create a task list and add task to it", type: :feature do
  include Helpers

  before :each do
    @user = User.create(name: 'JOhn Doe', email: 'John@doe.com', password: 'password')
  end

  it "create a task list and add tasks to it" do
    login_as(@user, scope: :user)

    visit user_task_lists_path(@user)
    
    page.find(".button").trigger("click")
    
    print page.html
    within(".simple_form") do
      fill_in 'Name', with: 'tarefa 1'
      click_button 'Create'
    end
    
    expect(page).to have_current_path user_task_lists_path(@user)
    expect(page).to have_content 'tarefa 1'

    click_link 'tasks'

    within(".form-inputs") do
      field = find(".task_description")
      field.set "task 1\n"
      wait_for_ajax
      # fill_in 'task_description', with: 'task 1'
      # find('.task_description').native.send_keys(:return)
    end
    
  end
end
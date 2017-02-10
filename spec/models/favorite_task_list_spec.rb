require 'rails_helper'

RSpec.describe FavoriteTaskList, type: :model do
  
  let (:user) { User.create(name: 'Philipe', email: 'philipesousacortez@gmail.com', password: 'acme123') }
  
  let (:task_list) { TaskList.create(name: 'Tarefas do dia', user: user) }

  subject { FavoriteTaskList.new(user: user, task_list: task_list) }

  it 'has a user' do
    expect(subject.user_id).to eq(user.id)
  end

  it 'has a task list' do
    expect(subject.task_list_id).to eq(task_list.id)
  end

  context 'assosiation' do
    it 'belongs to a user' do
      expect(FavoriteTaskList.reflect_on_association(:user).macro).to be(:belongs_to)
    end
    it 'belongs to a task list' do
      expect(FavoriteTaskList.reflect_on_association(:task_list).macro).to be(:belongs_to)
    end
  end
end



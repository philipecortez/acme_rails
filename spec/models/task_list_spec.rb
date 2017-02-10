require 'rails_helper'

RSpec.describe TaskList, type: :model do

  let! (:user) { User.create(name: 'Philipe', email: 'philipesousacortez@gmail.com', password: 'acme123') }
  
  subject! { TaskList.create(name: 'Tarefas do dia', user: user) }

  it 'has a name' do
    expect(subject.name).to eq('Tarefas do dia')
  end

  it 'default value for public is false' do
    expect(subject.public).to be_falsy
  end

  it 'can be public' do
    subject.public = true
    expect(subject.public).to be_truthy
  end



  context 'favorite' do

    before(:each) do
      another_user = User.create(name: 'John', email: 'john@doe.com', password: 'acme123')
      TaskList.create(name: 'Tarefas do dia 2', user: @another_user)
    end

    it 'can be favorited' do
      subject.favorite(user.id)
      expect(user.favorited_task_lists).to include(subject)
    end

    it 'can be unfavorited' do
      subject.unfavorite(user.id)
      expect(user.favorited_task_lists).to_not include(subject)
    end


  end

  describe '.from_user' do
    
    before(:each) do
      @another_user = User.create(name: 'John', email: 'john@doe.com', password: 'acme123')
      TaskList.create(name: 'Tarefas do dia 2', user: @another_user)
    end
    
    it 'returns only task lists for a specified user' do
      expect(TaskList.from_user(@another_user.id).pluck(:user_id)).to all(eq @another_user.id)
    end

    it 'returns all task lists of a specified user' do
      expect(TaskList.from_user(@another_user.id).count).to eq(@another_user.task_lists.count)
    end
  end

  describe '.public' do
    before(:each) do
      TaskList.create(name: 'Tarefas do dia 2', user: user, public: true)
    end

    it 'returns only public task lists' do
      expect(TaskList.publics.pluck(:public)).to all(eq true)
    end

    it 'retruns all public task lists' do
      expect(TaskList.publics.count).to eq(1)
    end

  end

  context 'is valid' do
    it 'with valid attributes' do
      expect(subject).to be_valid
    end
  end

  context 'is not valid' do
    it 'without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'without a user' do
      subject.user = nil
      expect(subject).to_not be_valid
    end
  end

  context 'associations' do

    it 'has many users who favored it' do
      expect(TaskList.reflect_on_association(:users_who_favored).macro).to eq(:has_many)
    end

    it 'belongs to a user' do
      expect(TaskList.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it 'has many tasks' do
      expect(TaskList.reflect_on_association(:tasks).macro).to eq(:has_many)
    end
  end

end

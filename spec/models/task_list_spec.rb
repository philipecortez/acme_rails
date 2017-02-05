require 'rails_helper'

RSpec.describe TaskList, type: :model do
  
  let(:user) { User.new(name: 'Philipe', email: 'philipesousacortez@gmail.com', password: 'acme123') }
  
  subject { TaskList.new(name: 'Tarefas do dia', user: user) }

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

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a user' do
      subject.user = nil
      expect(subject).to_not be_valid
    end
  end

  context 'associations' do
    it 'belongs to a user' do
      expect(TaskList.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it 'has many tasks' do
      expect(TaskList.reflect_on_association(:tasks).macro).to eq(:has_many)
    end
  end
end

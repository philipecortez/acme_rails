require 'rails_helper'

RSpec.describe TaskList, type: :model do
  
  let(:user) { User.new(name: 'Philipe', email: 'philipesousacortez@gmail.com', password: 'acme123') }
  
  subject { TaskList.new(name: 'Tarefas do dia', public: true, user: user) }

  it 'has a name' do
    expect(subject.name).to eq('Tarefas do dia')
  end

  it 'can be public' do
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
end

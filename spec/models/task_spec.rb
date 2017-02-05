RSpec.describe Task do

  let(:user) { User.new(name: 'Philipe', email: 'philipesousacortez@gmail.com', password: 'acme123') }

  let(:task_list) { TaskList.create(name: 'Tarefas do dia', user: user) }

  subject { Task.create(description: "Acme global domination", task_list: task_list) }

  it 'has a description' do
    expect(subject.description).to eq("Acme global domination")
  end

  it 'default value to completed is false' do
    expect(subject.completed?).to be_falsy
  end

  it 'can be completed' do
    subject.completed = true
    expect(subject.completed).to be_truthy
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is invalid without a description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid without a task list' do
      subject.task_list = nil
      expect(subject).to_not be_valid
    end

  end

  context 'associations' do
    it 'belongs to a task list' do
      expect(Task.reflect_on_association(:task_list).macro).to eq(:belongs_to)
    end

  end


end
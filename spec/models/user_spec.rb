require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject { User.new(name: 'Philipe', email: 'philipesousacortez@gmail.com', password: 'acme123') }
  
  it 'has a name' do
    expect(subject.name).to eq('Philipe')
  end
  
  it 'has a email' do
    expect(subject.email).to eq('philipesousacortez@gmail.com')
  end
  
  it 'has a password' do
    expect(subject.password).to eq('acme123')
  end

  context "validations" do

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end

  context "associations" do
    it 'has many task lists' do
      expect(User.reflect_on_association(:task_lists).macro).to eq(:has_many)
    end

    
  end

end

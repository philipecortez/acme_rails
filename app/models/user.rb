class User < ActiveRecord::Base
  validates :email, :name, :password, presence: true

  has_many :task_lists
end
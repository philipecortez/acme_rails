class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, :name, :password, presence: true

  has_many :task_lists

  has_many :favorite_task_lists
  has_many :favorited_task_lists, through: :favorite_task_lists, source: :task_list
end
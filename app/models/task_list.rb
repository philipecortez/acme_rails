class TaskList < ActiveRecord::Base
  
  validates :name, presence: true

  belongs_to :user
  has_many :tasks

  scope :from_user, lambda { |user| where(user: user) }
  scope :publics, lambda { where(public: true)}
end
class Task < ActiveRecord::Base
  validates :description, presence: true

  belongs_to :task_list

  scope :from_task_list, lambda { |task_list_id| where(task_list_id: task_list_id) }
end
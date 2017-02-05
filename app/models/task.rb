class Task < ActiveRecord::Base
  validates :description, presence: true

  belongs_to :task_list

end
class TaskList < ActiveRecord::Base
  
  validates :name, presence: true

  belongs_to :user
  has_many :tasks

  has_many :favorite_task_lists
  has_many :users_who_favored, through: :favorite_task_lists, source: :user


  scope :from_user, lambda { |user| where(user: user) }
  scope :publics, lambda { where(public: true)}

  def favorite(user_id)
    FavoriteTaskList.where(user_id: user_id, task_list_id: self.id).first_or_create
  end

  def unfavorite(user_id)
    FavoriteTaskList.where(user_id: user_id, task_list_id: self.id).destroy_all
  end
end
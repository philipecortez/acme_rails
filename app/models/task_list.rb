class TaskList < ActiveRecord::Base
  
  validates :name, presence: true

  belongs_to :user
  has_many :tasks

  has_many :favorite_task_lists
  has_many :users_who_favored, through: :favorite_task_lists, source: :user


  scope :from_user, lambda { |user_id| where(user_id: user_id) }
  scope :publics, lambda { where(public: true)}

  def toggle_bookmark_for(user_id)
    if is_bookmarked_by?(user_id)
      unbookmark(user_id)
    else
      bookmark(user_id)      
    end      
  end

  def bookmark(user_id)
    FavoriteTaskList.where(user_id: user_id, task_list_id: self.id).first_or_create
  end

  def unbookmark(user_id)
    FavoriteTaskList.where(user_id: user_id, task_list_id: self.id).destroy_all
  end

  def is_bookmarked_by?(user_id)
    FavoriteTaskList.where(user_id: user_id, task_list_id: self.id).present?
  end
end
class CreateFavoriteTaskLists < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_task_lists do |t|
      t.belongs_to :user, index: true
      t.belongs_to :task_list, index: true
      t.timestamps
    end
  end
end

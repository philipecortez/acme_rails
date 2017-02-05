class ChangeTaskListPublicColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :task_lists, :public, :boolean, default: false
  end
end

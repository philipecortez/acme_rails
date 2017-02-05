class CreateTaskList < ActiveRecord::Migration[5.0]
  def change
    create_table :task_lists do |t|
      t.text :name
      t.integer :user_id
      t.boolean :public
    end

    add_index :task_lists, :user_id
  end
end

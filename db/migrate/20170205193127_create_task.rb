class CreateTask < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :description, null: false
      t.integer :task_list_id, null: false
      t.boolean :completed, null: false, default: false
    end
  end
end

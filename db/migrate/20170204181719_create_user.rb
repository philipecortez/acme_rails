class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
      t.text :password
    end
  end
end

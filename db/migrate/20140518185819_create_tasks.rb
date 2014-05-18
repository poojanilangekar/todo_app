class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  add_index :microposts, [:user_id, :created_at]
  end
end

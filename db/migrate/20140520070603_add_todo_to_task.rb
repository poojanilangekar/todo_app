class AddTodoToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :todolist_id, :integer
  end
end

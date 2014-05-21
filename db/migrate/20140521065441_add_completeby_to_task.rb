class AddCompletebyToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :completeby, :date
  end
end

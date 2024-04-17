class AddColumnToRoom < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :count, :integer, null: false, default: 0
    change_column :rooms, :current_question, :integer, null: false, default: 1
  end
end

class AddResultColumnToRoom < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :result, :integer, null: false, default: 0
  end
end

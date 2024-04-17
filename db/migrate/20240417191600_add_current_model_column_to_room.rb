class AddCurrentModelColumnToRoom < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :current_model, :string
  end
end

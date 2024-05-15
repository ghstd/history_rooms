class RemoveColumnFromNotes < ActiveRecord::Migration[7.1]
  def change
    remove_column :notes, :body
  end
end

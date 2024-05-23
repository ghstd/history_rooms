class DropTableRooms < ActiveRecord::Migration[7.1]
  def change
    drop_table :rooms
  end
end

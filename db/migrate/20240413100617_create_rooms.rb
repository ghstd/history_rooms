class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :room_id, null: false, index: {unique: true}
    end
  end
end

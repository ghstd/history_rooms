class CreateJoinTableUserNote < ActiveRecord::Migration[7.1]
  def change
    create_join_table :users, :notes do |t|
      t.index :user_id
      t.index :note_id
    end
  end
end

class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.text :body, null: false
      t.string :author, null: false
      t.belongs_to :room, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end

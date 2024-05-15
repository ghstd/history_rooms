class CreateNoteItems < ActiveRecord::Migration[7.1]
  def change
    create_table :note_items do |t|
      t.text :body
      t.belongs_to :note, index: true, foreign_key: true

      t.timestamps
    end
  end
end

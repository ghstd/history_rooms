class CreateWhatNextQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :what_next_questions do |t|
      t.string :question, null: false
      t.text :options
      t.string :correct_answer

      t.timestamps
    end
  end
end

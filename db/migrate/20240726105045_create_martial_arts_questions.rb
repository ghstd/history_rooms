class CreateMartialArtsQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :martial_arts_questions do |t|
      t.string :question
      t.text :options, array: true, default: []
      t.string :correct_answer

      t.timestamps
    end
  end
end

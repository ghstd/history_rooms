class CreateTaiwanHistoryQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :taiwan_history_questions do |t|
      t.string :question
      t.text :options, array: true, default: []
      t.string :correct_answer

      t.timestamps
    end
  end
end

class CreateCoralQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :coral_questions do |t|
      t.string :question, null: false
      t.jsonb :options, array: true, default: [], null: false
      t.jsonb :answer, array: true, default: [], null: false

      t.timestamps
    end
  end
end

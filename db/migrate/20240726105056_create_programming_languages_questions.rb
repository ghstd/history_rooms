class CreateProgrammingLanguagesQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :programming_languages_questions do |t|
      t.string :question
      t.text :options
      t.string :correct_answer

      t.timestamps
    end
  end
end

class CreateCohereStandartQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :cohere_standart_questions do |t|
      t.string :question
      t.text :options
      t.string :correct_answer

      t.timestamps
    end
  end
end

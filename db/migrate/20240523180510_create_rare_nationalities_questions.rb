class CreateRareNationalitiesQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :rare_nationalities_questions do |t|
      t.string :question
      t.text :options
      t.string :correct_answer

      t.timestamps
    end
  end
end

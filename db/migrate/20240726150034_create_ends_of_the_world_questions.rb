class CreateEndsOfTheWorldQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :ends_of_the_world_questions do |t|
      t.string :question
      t.text :options
      t.string :correct_answer

      t.timestamps
    end
  end
end

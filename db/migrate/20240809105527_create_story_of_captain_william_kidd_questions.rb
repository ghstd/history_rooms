class CreateStoryOfCaptainWilliamKiddQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :story_of_captain_william_kidd_questions do |t|
      t.string :question
      t.text :options, array: true, default: []
      t.string :correct_answer

      t.timestamps
    end
  end
end

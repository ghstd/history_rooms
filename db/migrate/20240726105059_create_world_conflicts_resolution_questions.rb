class CreateWorldConflictsResolutionQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :world_conflicts_resolution_questions do |t|
      t.string :question
      t.text :options
      t.string :correct_answer

      t.timestamps
    end
  end
end

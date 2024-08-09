class CreateNapoleonBonapartesLifeStoriesQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :napoleon_bonapartes_life_stories_questions do |t|
      t.string :question
      t.text :options, array: true, default: []
      t.string :correct_answer

      t.timestamps
    end
  end
end

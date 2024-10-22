class CreateDronesQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :drones_questions do |t|
      t.string :question
      t.text :options
      t.string :correct_answer

      t.timestamps
    end
  end
end

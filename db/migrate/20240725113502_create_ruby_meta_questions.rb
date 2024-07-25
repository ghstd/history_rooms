class CreateRubyMetaQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :ruby_meta_questions do |t|
      t.string :question
      t.text :options, array: true, default: []
      t.string :correct_answer

      t.timestamps
    end
  end
end

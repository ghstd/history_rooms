class CreateRubyExeptionsBlocksQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :ruby_exeptions_blocks_questions do |t|
      t.string :question
      t.text :options
      t.string :correct_answer

      t.timestamps
    end
  end
end

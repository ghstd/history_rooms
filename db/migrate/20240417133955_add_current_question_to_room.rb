class AddCurrentQuestionToRoom < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :current_question, :integer, null: false, default: 0
  end
end

class DropOldCohereQuestionsTables < ActiveRecord::Migration[7.1]
  def change
    drop_table :art_questions
    drop_table :cities_questions
    drop_table :coral_questions
    drop_table :detailed_questions
    drop_table :is_true_questions
    drop_table :random_questions
    drop_table :rivers_questions
    drop_table :standard_questions
    drop_table :survival_questions
    drop_table :what_mean_questions
    drop_table :what_next_questions
    drop_table :when_where_questions
    drop_table :who_said_questions
  end
end

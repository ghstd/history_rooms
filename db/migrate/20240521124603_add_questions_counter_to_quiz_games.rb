class AddQuestionsCounterToQuizGames < ActiveRecord::Migration[7.1]
  def change
    add_column :quiz_games, :questions_counter, :integer, default: 1
  end
end

class AddQuestionsSourceToQuizGames < ActiveRecord::Migration[7.1]
  def change
    add_column :quiz_games, :questions_source, :string
  end
end

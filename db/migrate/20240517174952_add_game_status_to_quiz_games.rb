class AddGameStatusToQuizGames < ActiveRecord::Migration[7.1]
  def change
    add_column :quiz_games, :game_status, :string, default: "configuring"
  end
end

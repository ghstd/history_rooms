class AddPlayerColorToQuizPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :quiz_players, :player_color, :string
  end
end

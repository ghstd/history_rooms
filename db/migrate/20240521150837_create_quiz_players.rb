class CreateQuizPlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :quiz_players do |t|
      t.integer :player_id, index: true
      t.text :player_answers, array: true, default: []

      t.timestamps
    end

    add_reference :quiz_players, :quiz_game, foreign_key: true
  end
end

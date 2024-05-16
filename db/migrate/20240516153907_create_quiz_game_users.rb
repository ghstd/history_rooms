class CreateQuizGameUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :quiz_game_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quiz_game, null: false, foreign_key: true

      t.timestamps
    end
  end
end

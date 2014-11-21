class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :game_id
      t.integer :score
      t.integer :place
      t.integer :correct
      t.integer :asterisk
      t.integer :player_id

      t.timestamps
    end
  end
end

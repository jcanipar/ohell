class CreateHands < ActiveRecord::Migration
  def change
    create_table :hands do |t|
      t.integer :bid
      t.integer :got
      t.integer :player_id
      t.integer :round_num
      t.integer :game_id

      t.timestamps
    end
  end
end

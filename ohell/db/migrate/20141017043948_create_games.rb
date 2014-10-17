class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :date
      t.integer :numPlay
      t.boolean :league

      t.timestamps
    end
  end
end

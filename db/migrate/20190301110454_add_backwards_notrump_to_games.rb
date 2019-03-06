class AddBackwardsNotrumpToGames < ActiveRecord::Migration
  def change
    add_column :games, :backwards, :boolean
    add_column :games, :notrump, :boolean
  end
end

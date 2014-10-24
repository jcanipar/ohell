class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
      t.string :nickname
      t.boolean :team

      t.timestamps
    end
  end
end

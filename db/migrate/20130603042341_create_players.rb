class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :surname
      t.string :given_name
      t.integer :games
      t.integer :games_started
      t.integer :at_bats
      t.integer :runs
      t.integer :hits
      t.integer :home_runs
      t.integer :rbi
      t.integer :steals
      t.integer :sacrifice_flies
      t.integer :walks
      t.integer :hit_by_pitch

      t.timestamps
    end
  end
end

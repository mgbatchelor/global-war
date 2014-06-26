class CreateGamesUsers < ActiveRecord::Migration
  def change
    create_table :games_users do |t|
      t.references :game, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end

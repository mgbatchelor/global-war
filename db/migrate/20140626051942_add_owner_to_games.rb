class AddOwnerToGames < ActiveRecord::Migration
  def change
    add_reference :games, :owner, index: true
  end
end

class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.text :state
      t.references :game, index: true

      t.timestamps
    end
  end
end

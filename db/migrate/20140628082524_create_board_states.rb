class CreateBoardStates < ActiveRecord::Migration
  def change
    create_table :board_states do |t|
      t.text :state
      t.references :board, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end

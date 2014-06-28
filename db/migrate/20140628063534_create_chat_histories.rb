class CreateChatHistories < ActiveRecord::Migration
  def change
    create_table :chat_histories do |t|
      t.references :game, index: true
      t.references :user, index: true
      t.text :message

      t.timestamps
    end
  end
end

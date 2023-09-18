# frozen_string_literal: true

class CreateChatMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_messages do |t|
      t.text :content
      t.integer :user_id
      t.integer :conversation_id
      t.integer :state

      t.timestamps
    end
  end
end

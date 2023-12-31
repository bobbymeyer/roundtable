# frozen_string_literal: true

class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.integer :user_id
      t.integer :conversation_id

      t.timestamps
    end
  end
end

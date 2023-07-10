class CreateConversations < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations do |t|
      t.string :title
      t.integer :user_id
      t.string :slug

      t.timestamps
    end
  end
end

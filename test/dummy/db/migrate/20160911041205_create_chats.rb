class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_conversations do |t|
      t.timestamps
    end

    create_table :chat_sessions do |t|
      t.belongs_to :conversation
      t.belongs_to :user

      t.timestamps
    end

    create_table :chat_messages do |t|
      t.belongs_to :user
      t.text :text
      t.belongs_to :conversation
      t.attachment :image

      t.timestamps
    end

    add_column :users, :chat_status, :string, default: 'offline'
  end
end

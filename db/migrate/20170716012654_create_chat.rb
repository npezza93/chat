# frozen_string_literal: true

class CreateChat < ActiveRecord::Migration[5.1]
  def self.up
    create_table :chat_conversations do |t|
      t.timestamps
    end

    create_sessions
    create_messages
  end

  def self.down
    drop_table :chat_conversations
    drop_table :chat_sessions
    drop_table :chat_messages
  end

  private

  def create_sessions
    create_table :chat_sessions do |t|
      t.belongs_to :conversation
      t.belongs_to :user

      t.timestamps
    end
  end

  def create_messages
    create_table :chat_messages do |t|
      t.belongs_to :user
      t.text :text
      t.belongs_to :conversation
      t.belongs_to :session
      t.attachment :image

      t.timestamps
    end
  end
end

# frozen_string_literal: true

class AddChatToUsers < ActiveRecord::Migration[5.0]
  def self.up
    add_column :users, :chat_status, :string, default: "offline"
  end

  def self.down
    remove_column :users, :chat_status, :string, default: "offline"
  end
end

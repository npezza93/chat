# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :email, null: false, index: true
      t.string :first_name
      t.string :last_name
      t.attachment :image
      t.string :chat_status, default: "offline"
      add_password_tokens(t)
    end
  end

  private

  def add_password_tokens(table)
    table.string :encrypted_password, limit: 128, null: false
    table.string :confirmation_token, limit: 128
    table.string :remember_token, limit: 128, null: false, index: true
  end
end

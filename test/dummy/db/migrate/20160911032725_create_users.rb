# frozen_string_literal: true
class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.attachment :image
      add_tokens_password(t)
    end

    add_index :users, :email
    add_index :users, :remember_token
  end

  private

  def add_tokens_password(table)
    table.string :encrypted_password, limit: 128, null: false
    table.string :confirmation_token, limit: 128
    table.string :remember_token, limit: 128, null: false
  end
end

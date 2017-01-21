# frozen_string_literal: true
class Chat::Conversation < ApplicationRecord
  has_many :messages
  has_many :sessions, dependent: :destroy
  has_many :users, through: :sessions, class_name: "::User"

  has_one :last_message, -> { order(created_at: :desc) },
          class_name: "Chat::Message"

  validates :sessions, presence: {
    message: "At least one user must be selected"
  }
end

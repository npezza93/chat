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
  validate do
    conversations = Chat::Conversation.includes(:users).where.not(id: id)

    conversation_already_exists =
      conversations.map(&:user_ids).to_a.reject do |ids|
        (ids - user_ids).present?
      end.count.positive?

    next unless conversation_already_exists

    errors.add(:conversation, "already taking place")
  end
end

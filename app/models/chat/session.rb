# frozen_string_literal: true

class Chat::Session < ApplicationRecord
  belongs_to :conversation
  belongs_to :user, class_name: "::User"

  has_many :messages, dependent: :destroy

  validates :user_id, uniqueness: { scope: :conversation_id }
end

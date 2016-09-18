class Chat::Session < ApplicationRecord
  belongs_to :conversation
  belongs_to :user, class_name: "::User"

  has_many :messages, foreign_key: [:user_id, :conversation_id],
                      primary_key: [:user_id, :conversation_id],
                      dependent: :destroy

  validates :user_id, uniqueness: { scope: :conversation_id }
end

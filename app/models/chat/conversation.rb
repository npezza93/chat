class Chat::Conversation < ApplicationRecord
  has_many :messages
  has_many :sessions, dependent: :destroy
  has_many :users, through: :sessions, class_name: "::User"

  validates :sessions, presence: {
    message: "At least one user must be selected"
  }
end

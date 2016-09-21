class Chat::Message < ApplicationRecord
  has_attached_file :image
  validates_attachment :image, content_type: {
    content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  }

  belongs_to :user, class_name: "::User"
  belongs_to :conversation

  delegate :name, to: :user

  after_create_commit do
    Chat::MessageRelayJob.perform_later(self)
    Chat::NotificationRelayJob.perform_later(self)
  end
end

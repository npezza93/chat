class Chat::Message < ApplicationRecord
  has_attached_file :image
  validates_attachment :image, content_type: {
    content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  }

  belongs_to :user, class_name: "::User"
  belongs_to :conversation

  delegate :name, to: :user
  before_save :remove_extra_new_line
  before_save :execute_dot_command

  after_create_commit do
    Chat::MessageRelayJob.perform_now(id)
    Chat::NotificationRelayJob.perform_now(self)
  end

  private

  def execute_dot_command
    return unless dot_command.valid?

    dot_command.perform
  end

  def dot_command
    @dot_command ||= Chat::DotCommand.new(self, text)
  end

  def remove_extra_new_line
    self.text = text[0..-16]
  end
end

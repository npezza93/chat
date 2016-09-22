require "active_support/concern"

module Chat
  module User
    extend ActiveSupport::Concern

    included do
      has_many :sessions, dependent: :destroy, class_name: "::Chat::Session"
      has_many :conversations, through: :sessions,
                               class_name: "::Chat::Conversation"

      validates :chat_status, inclusion: { in: %w(online offline away) }

      after_commit :broadcast_status,
                   if: proc { |u| u.previous_changes.key?(:chat_status) }
    end

    def name
      "#{first_name} #{last_name}"
    end

    def online
      update(chat_status: "online")
    end

    def offline
      update(chat_status: "offline")
    end

    module ClassMethods
      def first_name
        "first_name"
      end

      def last_name
        "last_name"
      end
    end

    private

    def broadcast_status
      Chat::StatusRelayJob.perform_now(self)
    end
  end
end

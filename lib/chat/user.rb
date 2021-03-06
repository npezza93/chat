# frozen_string_literal: true

require "active_support/concern"

module Chat
  module User
    extend ActiveSupport::Concern

    included do
      has_many :sessions, dependent: :destroy, class_name: "::Chat::Session"
      has_many :conversations, through: :sessions,
                               class_name: "::Chat::Conversation"

      validates :chat_status, inclusion: { in: %w(online offline) }

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

    def chat_avatar
      send(Chat.user_avatar)
    end

    def chat_avatar?
      send("#{Chat.user_avatar}?")
    end

    private

    def broadcast_status
      Chat::StatusRelayJob.send(Chat.perform_method, self)
    end
  end
end

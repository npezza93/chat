# frozen_string_literal: true

module Chat
  class StatusRelayJob < ApplicationJob
    def perform(user)
      broadcast("chat::status", user_id: user.id, status: user.chat_status)
    end
  end
end

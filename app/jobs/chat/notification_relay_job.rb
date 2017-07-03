# frozen_string_literal: true

module Chat
  class NotificationRelayJob < ApplicationJob
    def perform(message)
      user_ids(message).each do |user_id|
        broadcast("users::#{user_id}::chats", chat_id: message.conversation_id)
      end
    end

    private

    def user_ids(message)
      message.conversation.users.where.not(id: message.user_id).ids
    end
  end
end

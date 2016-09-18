module Chat
  class NotificationRelayJob < ApplicationJob
    def perform(message)
      (message.conversation.user_ids - [message.user_id]).each do |user_id|
        ActionCable.server.broadcast(
          "users::#{user_id}::chats", chat_id: message.conversation_id
        )
      end
    end
  end
end

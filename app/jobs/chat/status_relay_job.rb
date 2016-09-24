module Chat
  class StatusRelayJob < ApplicationJob
    def perform(user)
      ActionCable.server.broadcast(
        "chat::status", user_id: user.id, status: user.chat_status
      )
    end
  end
end

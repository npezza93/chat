module Chat
  class MessageRelayJob < ApplicationJob
    def perform(message_id)
      message = Chat::Message.find(message_id)
      ActionCable.server.broadcast(
        "chats::#{message.conversation_id}::messages", render_message(message)
      )
    end

    def render_message(message)
      {
        user: message.user_id,
        avatar: avatar(message.user)
      }.merge(content(message))
    end

    def avatar(user)
      renderer.chat_avatar(user).to_s
    end

    def content(message)
      if message.image?
        {
          message: renderer.image_tag(
            message.image.url, class: "chat__message-image"
          ),
          image: true
        }
      else
        { message: message.text, image: false }
      end
    end

    private

    def renderer
      ApplicationController.helpers
    end
  end
end

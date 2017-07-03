# frozen_string_literal: true

module Chat
  class MessageRelayJob < ApplicationJob
    def perform(message_id)
      message = Chat::Message.find(message_id)
      broadcast(
        "chats::#{message.conversation_id}::messages", render_message(message)
      )
    end

    def render_message(message)
      {
        user: message.user_id, avatar: renderer.chat_avatar(message.user).to_s
      }.merge(content(message))
    end

    def content(message)
      if message.image?
        { message: renderer.image_tag(message.image.url), image: true }
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

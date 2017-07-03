# frozen_string_literal: true

class Chat::MessagesChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    stream_from "chats::#{data['chat_id']}::messages"
  end

  def unsubscribed
    stop_all_streams
  end
end

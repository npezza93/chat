class Chat::MessagesChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    stream_from "chats::#{data['chat_id']}::messages"
  end

  def unfollow
    stop_all_streams
  end
  alias unsubscribed unfollow
end

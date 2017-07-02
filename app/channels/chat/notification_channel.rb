# frozen_string_literal: true

class Chat::NotificationChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    stream_from "users::#{data['user_id']}::chats"
  end

  def unsubscribed
    stop_all_streams
  end
end

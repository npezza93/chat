# frozen_string_literal: true

class Chat::StatusChannel < ApplicationCable::Channel
  def online
    stop_all_streams
    stream_from "chat::status"
    current_user.online
  end

  def unsubscribed
    current_user.offline
    stop_all_streams
  end
end

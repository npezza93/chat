# frozen_string_literal: true

module Chat
  class ApplicationJob < ::ApplicationJob
    queue_as :default

    private

    def broadcast(channel, payload)
      ActionCable.server.broadcast(channel, payload)
    end
  end
end

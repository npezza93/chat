# frozen_string_literal: true
module Chat
  class DotCommand
    class Leave
      attr_reader :message, :text

      def initialize(message, text)
        @message = message
        @text = text
      end

      def perform
        message.session.destroy
        message.text = "#{message.user.name} has left the conversation"
      end
    end
  end
end

module Chat
  class DotCommand
    class Leave
      attr_reader :message, :text

      def initialize(message, text)
        @message = message
        @text = text
      end

      def perform
        message.user.leave_conversation(message.conversation)
      end
    end
  end
end

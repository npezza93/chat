# frozen_string_literal: true

module Chat
  class DotCommand
    class Shrug
      attr_reader :message, :text

      def initialize(message, text)
        @message = message
        @text = text
      end

      def perform
        message.text =
          if text.blank?
            shruggie
          else
            "#{text} #{shruggie}"
          end
      end

      private

      def shruggie
        '¯\_(ツ)_/¯'
      end
    end
  end
end

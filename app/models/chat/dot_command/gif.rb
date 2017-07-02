# frozen_string_literal: true

module Chat
  class DotCommand
    class Gif
      attr_reader :message, :text

      def initialize(message, text)
        @message = message
        @text = text
      end

      def perform
        message.image = open(::Giphy.random(text).image_url)
        message.text = nil
      end
    end
  end
end

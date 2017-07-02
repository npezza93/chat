# frozen_string_literal: true

module Chat
  class DotCommand
    attr_reader :text, :message

    def initialize(message, text)
      @message = message
      @text = text
    end

    def command
      @command ||= text[/^\.[a-zA-z]*/]
    end

    def perform
      return false unless valid?

      ("Chat::DotCommand::" + command[1..-1].classify).constantize.new(
        message, text[/[^\.[a-zA-z]*].*/]&.squish
      ).perform
    end

    def valid?
      Chat::DotCommand::Validator.new(command).perform
    end
  end
end

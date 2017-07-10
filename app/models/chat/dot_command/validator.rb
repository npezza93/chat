# frozen_string_literal: true

module Chat
  class DotCommand
    class Validator
      attr_reader :command

      def initialize(command)
        @command = command
      end

      def perform
        (commands + custom_commands).include? command
      end

      def commands
        %w(.gif .shrug)
      end

      def custom_commands
        []
      end
    end
  end
end

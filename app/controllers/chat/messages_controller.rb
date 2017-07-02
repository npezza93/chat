# frozen_string_literal: true

module Chat
  class MessagesController < ApplicationController
    before_action Chat.logged_in_check
    before_action :set_conversation
    before_action :set_session

    def create
      @conversation.messages.create(message_params)

      head :ok
    end

    def destroy
      @conversation.destroy
    end

    private

    def set_conversation
      @conversation = Chat::Conversation.find(params[:conversation_id])
    end

    def set_session
      @session = @conversation.sessions.find_by(user: current_user)
    end

    def message_params
      params.require(:message).permit(:text, :image).merge(
        user_id: current_user.id, session_id: @session.id
      )
    end
  end
end

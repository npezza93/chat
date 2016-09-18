module Chat
  class ConversationsController < ApplicationController
    before_action :require_login
    before_action :set_conversation, only: :show

    def show
    end

    def create
      @conversation = Chat::Conversation.create(conversation_params)
    end

    private

    def set_conversation
      @conversation = Chat::Conversation.includes(
        :users, messages: :user
      ).find(params[:id])
    end

    def conversation_params
      chat_params = params.require(:conversation).permit(user_ids: [])
      if chat_params[:user_ids].reject(&:blank?).present?
        chat_params[:user_ids] << current_user.id
      end

      chat_params
    end
  end
end

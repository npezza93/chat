# frozen_string_literal: true

module Chat
  class ConversationsController < ApplicationController
    before_action :set_conversation, only: :show

    def show
    end

    def create
      @conversation = Chat::Conversation.create(conversation_params)

      if @conversation.persisted? ||
          @conversation.errors.messages[:sessions].present?
        render template: "chat/conversations/create"
      else
        @conversation = find_existing_conversation
        render template: "chat/conversations/show"
      end
    end

    private

    def set_conversation
      @conversation = Chat::Conversation.includes(
        :users, messages: :user
      ).find(params[:id])
    end

    def conversation_params
      chat_params = params.require(:conversation).permit(user_ids: [])
      if chat_params[:user_ids].reject!(&:blank?).present?
        chat_params[:user_ids] << current_user.id
        chat_params[:user_ids].map!(&:to_i)
      end

      chat_params
    end

    def find_existing_conversation
      Chat::Conversation.includes(
        :users, messages: :user
      ).find(
        Chat::Conversation.joins(:users).having(
          "COUNT(DISTINCT users.id) = ?", conversation_params[:user_ids].count
        ).group(:id).find_by(
          users: { id: conversation_params[:user_ids] }
        ).id
      )
    end
  end
end

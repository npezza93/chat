# frozen_string_literal: true
module Chat
  module ApplicationHelper
    def render_chat
      return unless send Chat.signed_in

      render "chat/chat"
    end

    def launch_chat_fab
      attrs = {
        class: "chat__launch", data: { "current-user" => current_user.id }
      }
      button_tag(attrs) do
        material_icon.forum.css_class("md-dark").to_s.html_safe
      end
    end

    def chatable_users
      @chatable_users ||= ::User.where.not(id: current_user.id)
    end

    def chatable_user_check_boxes(f)
      f.collection_check_boxes(:user_ids, chatable_users, :id, :name) do |b|
        b.check_box + b.label(class: b.object.chat_status) do
          content_tag(
            :div, b.text,
            class: "chat__status #{b.object.chat_status}"
          )
        end
      end
    end

    def chat_avatar(user)
      if user.send(Chat.user_avatar.to_s + "?")
        image_tag(user.send(Chat.user_avatar), class: "chat__user-avatar")
      else
        MaterialIcon.new.css_class("chat__user-avatar").person
      end
    end

    def chat_list
      @chat_list ||= current_user.conversations.includes(:users).order(
        "chat_conversations.created_at desc"
      )
    end

    def chat_avatars(conversation)
      (conversation.users - [current_user]).first(2).map do |u|
        chat_avatar(u)
      end
    end

    def chat_avatar_count(conversation)
      if (count = conversation_user_count(conversation)) <= 2
        "count_#{count}"
      else
        "count_default"
      end
    end

    def conversation_user_count(conversation)
      conversation.users.to_a.size - 1
    end

    def message_classes(message)
      css_class = message.user == current_user ? "right" : "left"
      css_class += message.image? ? " image" : ""
      css_class
    end
  end
end

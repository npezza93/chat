module Chat
  module ApplicationHelper
    def render_chat(background = "#7EE48E", color = "light")
      return unless send Chat.signed_in

      render "chat/chat", background: background, color: color
    end

    def launch_chat_fab(background = "#7EE48E", color = "light")
      attrs = {
        class: "chat__launch", style: "background: #{background}",
        data: { "current-user" => current_user.id }
      }
      button_tag(attrs) do
        material_icon.forum.css_class("md-#{color}").to_s.html_safe
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
      (conversation.users - [current_user]).first(5).collect do |u|
        image_tag u.image.url
      end.join("").html_safe
    end

    def chat_avatar_count(conversation)
      if (count = conversation.users.to_a.size - 1) <= 5
        "count_#{count}"
      else
        "count_default"
      end
    end
  end
end

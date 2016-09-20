module Chat
  module ApplicationHelper
    def render_chat(background = nil, color = nil)
      return unless send Chat.signed_in

      render "chat/chat", background: background, color: color
    end

    def launch_chat_fab(background = "#4CAF50", color = "light")
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

    def chat_avatar(user)
      if user.image?
        image_tag(user.image, class: "chat__user-avatar")
      else
        material_icon.person.css_class("chat__user-avatar")
      end
    end

    def chat_list
      @chat_list ||=
        Chat::Conversation.joins(:users)
                          .group("chat_sessions.conversation_id")
                          .select(:id, group_concat)
                          .merge(current_user.conversations)
                          .order(created_at: :desc)
    end

    private

    def group_concat
      if ActiveRecord::Base.connection.adapter_name == "SQLite"
        "GROUP_CONCAT(users.#{::User.first_name} || ' ' || users.#{::User.last_name}, ', ') as names"
      elsif ActiveRecord::Base.connection.adapter_name == "MySQL"
        "GROUP_CONCAT(CONCAT(\"users.#{User.first_name}\",\" \", \"users.#{User.last_name}\") "\
        "SEPARATOR ', ') as names"
      end
    end
  end
end

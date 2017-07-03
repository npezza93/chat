App.chat_status =
  App.cable.subscriptions.create "Chat::StatusChannel",
    connected: ->
      @perform "online", user_id: App.chat_notification.current_user()

    disconnected: ->
      @perform "unsubscribed", user_id: App.chat_notification.current_user()

    received: (data) ->
      label = $("label[for='conversation_user_ids_#{data.user_id}'] .chat__status")
      label.removeClass("offline")
      label.removeClass("online")
      label.addClass(data.status)

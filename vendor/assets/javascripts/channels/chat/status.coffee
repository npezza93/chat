App.chat_status =
  App.cable.subscriptions.create "Chat::StatusChannel",
    connected: ->
      @perform 'online'

    disconnected: ->
      @perform 'offline'

    received: (data) ->
      label = $("label[for='chat_user_ids_#{data.user_id}']")
      label.removeClass()
      label.addClass(data.status)

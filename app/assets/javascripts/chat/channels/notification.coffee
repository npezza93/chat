App.chat_notification =
  App.cable.subscriptions.create "Chat::NotificationChannel",
    connected: ->
      @perform 'follow', user_id: @current_user()

    disconnected: ->

    received: (data) ->
      if @current_chat() != data.chat_id || !@viewing_transcript()
        @add_notification(data.chat_id)
        $("#chat__show-#{data.chat_id}").addClass("chat__has_new_message")

    current_user: ->
      if $(".chat__launch").length > 0
        $(".chat__launch").data().currentUser

    current_chat: ->
      App.chat_message.current_chat()

    viewing_transcript: ->
      $(".current_chat").css("display") == "flex"

    add_notification: (id) ->
      classes = "#chat .chat__settings, .chat__launch"
      $(classes).addClass('chat__badge')
      $(classes).attr('data-badge', @new_notification_count(id))

    new_notification_count: (id) ->
      @notification_count() + @notification_increment(id)

    notification_count: ->
      parseInt($("#chat .chat__settings").data('badge') || 0)

    notification_increment: (id) ->
      if $("#chat__show-#{id}").hasClass('chat__has_new_message')
        0
      else
        1

    decrement: ->
      classes = "#chat .chat__settings, .chat__launch"
      if @notification_count() == 1
        $(classes).removeClass('chat__badge')
      $(classes).attr('data-badge', @notification_count() - 1)

App.chat_message =
  App.cable.subscriptions.create 'Chat::MessagesChannel',
    collection: -> $("[data-channel='messages']")

    connected: ->
      @followCurrentChat()

    received: (data) ->
      @collection().append @generateMessage(data)
      height = $('.current_chat').prop('scrollHeight')
      $('.current_chat').animate { scrollTop: height }, 'slow'

    followCurrentChat: ->
      if chatId = @current_chat()
        @perform 'follow', chat_id: chatId
      else
        @perform 'unsubscribed'

    current_user: ->
      if @collection().length > 0
        @collection().data().currentUser

    current_chat: ->
      if @collection().length > 0
        @collection().data().currentChat

    div: (classes = "")->
      element = document.createElement('div')
      element.classList += classes if classes.length > 0
      element

    render_container: (user) ->
      @div("message-container #{if user == @current_user() then 'right' else ''}")

    render_avatar: (data) ->
      last_message_classes = @collection().children().last()[0]
      last_message_classes =
        if last_message_classes == undefined
          []
        else
          last_message_classes.classList

      if data.user == @current_user() &&
          $.inArray("right", last_message_classes) >= 0
        @div("transcript_placeholder_avatar").outerHTML
      else
        data.avatar

    render_content: (data) ->
      el = @div("message #{if data.image then 'image' else ''}")
      if data.image
        el.innerHTML = data.message
      else
        content = @div("content")
        content.innerHTML = data.message
        el.innerHTML = content.outerHTML

      el

    generateMessage: (data) ->
      container = @render_container(data.user)
      container.innerHTML =
        @render_avatar(data) + @render_content(data).outerHTML

      container

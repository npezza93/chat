App.chat_message =
  App.cable.subscriptions.create 'Chat::MessagesChannel',
    collection: -> $("[data-channel='messages']")

    connected: ->
      @followCurrentChat()

    received: (data) ->
      @collection().append @generateMessage(data)
      height = $('.chat__transcript').prop('scrollHeight')
      $('.chat__transcript').animate { scrollTop: height }, 'slow'

    followCurrentChat: ->
      if chatId = @current_chat()
        @perform 'follow', chat_id: chatId
      else
        @perform 'unfollow'

    current_user: ->
      if @collection().length > 0
        @collection().data().currentUser

    current_chat: ->
      if @collection().length > 0
        @collection().data().currentChat

    div: ->
      document.createElement('div')

    flex: ->
      element = @div()
      element.classList += 'chat__flex'
      element.outerHTML

    text_message_container: ->
      element = @div()
      element.classList += 'chat__message'
      element

    image_message_container: ->
      element = @div()
      element.classList += 'chat__image-message'
      element

    image_message: (data) ->
      element = @image_message_container()
      if data.user == @current_user()
        element.classList += ' current'
      element.innerHTML = data.message
      element.outerHTML

    message: (data) ->
      element = @div()
      element.classList += 'text'
      if data.user == @current_user()
        element.classList += ' right'
      else
        element.classList += ' left'
      element.innerHTML = data.message
      element.outerHTML

    text_message: (data) ->
      msg = [data.avatar, @message(data), @flex()]
      msg = msg.reverse() if data.user == @current_user()

      message = @text_message_container()
      message.innerHTML = msg.join('')
      message.outerHTML


    generateMessage: (data) ->
      if data.image
        @image_message(data)
      else
        @text_message(data)

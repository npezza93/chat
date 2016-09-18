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

    message_container: ->
      element = @div()
      element.classList += 'message'
      element

    message: (data) ->
      element = @div()
      element.classList += 'text'
      if data.user == @current_user()
        element.classList += ' right'
      else
        element.classList += ' left'
      element.innerHTML = data.message
      element.outerHTML

    setup_element_array: (data) ->
      if data.image
        [data.avatar, @message(data)]
      else
        [data.avatar, @message(data), @flex()]

    generateMessage: (data) ->
      $('#message_text').prop('value', '')
      if data.user == @current_user()
        inner_message = @setup_element_array(data).reverse().join('')
      else
        inner_message = @setup_element_array(data).join('')

      message = @message_container()
      message.innerHTML = inner_message
      message.outerHTML

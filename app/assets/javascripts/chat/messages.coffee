event =
  if typeof(Turbolinks) == "undefined"
    'DOMContentLoaded'
  else
    'turbolinks:load'

document.addEventListener event, ->
  $('.chat__launch').click ->
    $('#chat').addClass('active')
    show_chats()
    return

  $('.chat__close').click ->
    $('#chat').removeClass('active')
    return

  $('.chat__settings').click ->
    show_chats()
    return

  $(document).on 'click', '.chat__start-new', (e) ->
    e.preventDefault()
    $('.chat__list').css('display', 'none')
    $('.new_conversation').css('display', 'flex')
    return

  $(document).on 'click', '.chat__insert-image', ->
    $(".new_message input[type='file']").click()
    return

  show_chats = ->
    $('.chat__list').css('display', 'flex')
    $('.current_chat').css('display', 'none')
    $('.new_conversation').css('display', 'none')
    return

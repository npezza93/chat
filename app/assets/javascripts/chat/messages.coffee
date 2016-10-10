event =
  if typeof(Turbolinks) == "undefined"
    'DOMContentLoaded'
  else
    'turbolinks:load'

document.addEventListener event, ->
  $('.chat__launch').click ->
    $('#chat').addClass('active')
    return

  $('.chat__close').click ->
    $('#chat').removeClass('active')
    return

  $('.chat__settings').click ->
    $('.current_chat').removeClass("slide_left")
    $('.chat__list').removeClass("slide_left")
    $('.chat__list').removeClass("slide_right")
    $('.chat__start-new').removeClass("disappear")
    $('.new_conversation').removeClass("slide_right")
    return

  $(document).on 'click', '.chat__start-new', (e) ->
    e.preventDefault()
    $('.chat__start-new').addClass("disappear")
    $('.chat__list').addClass("slide_right")
    $('.new_conversation').addClass("slide_right")
    return

  $(document).on 'click', '.chat__insert-image', ->
    $(".new_message input[type='file']").click()
    return

  $(document).on 'keyup', '.new_message .emojionearea-editor', (e) ->
    if e.keyCode == 13 && !e.shiftKey
      str = $('.new_message .emojionearea-editor').html()
      $('.new_message textarea').val(str)
      $('.new_message').submit()
      $('#message_text').prop('value', '')
      el = $('.new_message textarea').emojioneArea()
      el[0].emojioneArea.setText('')
    return

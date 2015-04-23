$(document).ready ->

  #$('a#my_entries').click ->



  $('#sticky .avatar').popover
    html: true
    content: ->
      $('#sticky .user_avatar_actions_popover').html()

  if ! !$('#sticky').offset()
    stickyTop = $('#sticky').offset().top
    $(window).scroll ->
      windowTop = $(window).scrollTop()
      if stickyTop < windowTop
        $('#sticky').css
          position: 'fixed'
          top: 0
      else
        return

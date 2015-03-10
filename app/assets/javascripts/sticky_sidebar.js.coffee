$ ->
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


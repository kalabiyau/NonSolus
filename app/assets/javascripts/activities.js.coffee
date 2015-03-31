ready = ->

  $('#activity_203').click()
  #  TODO: remove me! ^

  $('#activity_search').keyup ->
    $.post('/activities/search',
      q: $(this).val().toLowerCase()
    ).done((html) ->
      $('#activities').html(html)
    )

$(document).ready(ready)
$(document).on('page:load', ready)


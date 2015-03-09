ready = ->
  $('#activity_search').keyup ->
    $.post('/activities/search',
      q: $(this).val().toLowerCase()
    ).done((html) ->
      $('#activities').html(html)
    )

$(document).ready(ready)
$(document).on('page:load', ready)


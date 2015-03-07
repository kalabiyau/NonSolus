$(document).ready ->
  $('#activity_search').keyup ->
    $.post('/activities/search',
      q: $(this).val()
    ).done((html) ->
      $('#activities').html(html)
    )

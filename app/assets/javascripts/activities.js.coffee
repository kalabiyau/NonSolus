$ ->

  $('#activity_search').keyup ->
    $.post('/activities/search',
      q: $(this).val().toLowerCase()
    ).done((html) ->
      $('#activities').html(html)
    )

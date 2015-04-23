$ ->
  $('form#activities_filter input[type=checkbox]').change (e) ->
    $.ajax('/activities',
      data: $('form#activities_filter').serialize()
    ).done((html) ->
      $('#activities').html(html)
    )

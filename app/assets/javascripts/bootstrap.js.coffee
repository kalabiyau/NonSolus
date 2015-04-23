$ ->
  $("a[rel~=tooltip], .has-tooltip").tooltip()
  $(document.body).tooltip({ selector: '[data-toggle="tooltip"]' }).tooltip()

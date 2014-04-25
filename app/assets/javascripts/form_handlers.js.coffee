$(document).on 'click', '[data-behavior="save-form"]', (e) ->
  el = $(e.target)
  form = $(el.data('target'))

  form.submit()

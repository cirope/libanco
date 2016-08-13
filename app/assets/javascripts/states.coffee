jQuery ($) ->
  $(document).on 'change', '.parent-model', ->
    data_url = $(this).attr 'data-child-url'

    if $(this).val() && data_url
      url = data_url.replace 'child_id', $(this).val()
      $.getScript url
    else
      $('.child-model').val('')

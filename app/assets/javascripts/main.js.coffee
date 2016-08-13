jQuery ($) ->
  $(document).on 'shown.bs.modal', '#modal', ->
    $(this).find('[autofocus]').focus()

  $(document).on 'hidden.bs.modal', '#modal', ->
    $('#modal').remove()

  $(document).on 'focus', '[data-date-picker]', ->
    $(this).datepicker({ language: 'es', todayHighlight: true, autoclose: true })

document.addEventListener 'turbolinks:load', ->
  $('[data-toggle="popover"]').popover({html: true})

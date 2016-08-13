jQuery ($) ->
  $(document).on 'shown.bs.modal', '#modal', ->
    $(this).find('[autofocus]').focus()

  $(document).on 'hidden.bs.modal', '#modal', ->
    $('#modal').remove()

  $(document).on 'focus', '[data-date-picker]:not(.hasDatepicker)', ->
    $(this).datepicker
      changeMonth: true,
      changeYear: true

document.addEventListener 'turbolinks:load', ->
  $('[data-toggle="popover"]').popover({html: true})

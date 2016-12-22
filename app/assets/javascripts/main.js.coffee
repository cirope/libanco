jQuery ($) ->
  $(document).on 'shown.bs.modal', '#modal', ->
    $(this).find('[autofocus]').focus()

  $(document).on 'hidden.bs.modal', '#modal', ->
    $('#modal').remove()

  $(document).on 'focus', '[data-date-picker]', ->
    $(this).datepicker
      changeMonth: true
      changeYear: true

  $(document).on 'update.autocomplete', '#model_id', (el) ->
    model_id = el.item.id
    autocomplete_url = $(this).attr('data-update-autocomplete-url').replace('model_id', model_id)

    if autocomplete_url
      $.getScript autocomplete_url

  $(document).on 'change', '#custom_template_kind', ->
    kind = $(this).val()
    url  = $('#templates-variables').attr 'data-templates-variables-url'
    $.get url, { kind: kind }, null, 'script'

document.addEventListener 'turbolinks:load', ->
  $('[data-submenu]').submenupicker()
  $('[data-toggle="popover"]').popover({html: true})

  $('textarea.ckeditor').each(->
    if $(this).css('visibility') != 'hidden'
      CKEDITOR.replace(this)
  )

jQuery ($) ->
  $(document).on 'show.bs.tab', '[data-tab-url]', ->
    window.location.hash = $(this).attr('href')
    url = $(this).data 'tab-url'
    loaded = $(this).data 'loaded'

    if url && !loaded
      $(this).attr('data-loaded', 'true')
      $.getScript url

document.addEventListener 'turbolinks:load', ->
  anchor = $('a[href^="'+window.location.hash+'"]')

  tab_focus = if anchor.length > 0 then anchor else $('[data-tab-focus]')
  tab_pane = tab_focus.closest('.tab-pane')

  parent = $('#nav-tabs a[href^="#'+tab_pane.attr('id')+'"]')
  parent.closest('li').addClass 'active'
  tab_pane.addClass 'active'
  tab_focus.tab 'show'

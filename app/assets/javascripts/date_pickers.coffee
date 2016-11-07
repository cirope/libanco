jQuery ($) ->
  $(document).on 'focus', '[data-date-picker]', ->
    $(this).datepicker({ language: 'es', todayHighlight: true, autoclose: true })

  $(document).on 'focus', '[data-date-range-picker]', ->
    $(this).daterangepicker
      autoApply: true
      alwaysShowCalendars: true
      linkedCalendars: false
      ranges:
        'Total': [moment("01012000", "MMDDYYYY"), moment()]
        'Hoy': [moment(), moment()],
        'Ayer': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
        'Esta semana': [moment().startOf('week'), moment().endOf('week')],
        'Semana pasada': [moment().subtract(1, 'week').startOf('week'), moment().subtract(1, 'week').endOf('week')]
        'Este mes': [moment().startOf('month'), moment().endOf('month')],
        'Mes pasado': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        'Este año': [moment().startOf('year'), moment().endOf('year')],
        'Año pasado': [moment().subtract(1, 'year').startOf('year'), moment().subtract(1, 'year').endOf('year')]
      locale:
        format: 'DD/MM/YYYY'
        customRangeLabel: 'Calendario'

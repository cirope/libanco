jQuery ($) ->
  start_simulation = ->
    $.get $('#loans').attr('data-simulator-url'), $('form').serialize(), null, 'script'

  $(document).on 'change', '#loan_credit_line_id, #loan_type, #loan_payment_frequency', ->
    start_simulation()

  $(document).on 'keyup', '#loan_amount, #loan_payments_count, #loan_first_payment_days', ->
    start_simulation()

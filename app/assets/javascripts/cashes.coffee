jQuery ($) ->
  $(document).on 'change', '#cash_invoice_is_voucher', ->
    if $(this).is(':checked')
      $('#cash_voucher_outcome').show()
    else
      $('#cash_voucher_outcome').hide()

  $(document).on 'change', '#cash_voucher_kind', ->
    if $(this).find(':selected').val()
      selected = $(this).find(':selected')
      owner_searches = selected.data 'owner-searches'
      owner_type     = selected.data 'owner-type'

      $('#cash_voucher_owner').attr 'data-autocomplete-url', owner_searches
      $('#cash_voucher_owner_type').val owner_type
      $('#owner_searches').show()
    else
      $('#cash_voucher_owner').attr 'data-autocomplete-url', ''
      $('#cash_voucher_owner').val ''
      $('input[name="cash_voucher[owner_id]"]').val ''
      $('#cash_voucher_owner_type').val ''
      $('#owner_searches').hide()

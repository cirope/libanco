require 'test_helper'

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice = invoices :default

    login
  end

  test 'should get index' do
    get invoices_url
    assert_response :success
  end

  test 'should get new' do
    get new_invoice_url
    assert_response :success
  end

  test 'should create invoice' do
    assert_difference('Invoice.count') do
      post invoices_url, params: { invoice: { amount: @invoice.amount, cash_id: @invoice.cash_id, date: @invoice.date, detail: @invoice.detail, gross_income_perception_amount: @invoice.gross_income_perception_amount, invoice_type_id: @invoice.invoice_type_id, number: @invoice.number, payment_method_id: @invoice.payment_method_id, payment_type_id: @invoice.payment_type_id, subtotal: @invoice.subtotal, supplier_id: @invoice.supplier_id, tax_amount: @invoice.tax_amount, tax_condition_id: @invoice.tax_condition_id, tax_perception_amount: @invoice.tax_perception_amount } }
    end

    assert_redirected_to invoice_url(Invoice.last)
  end

  test 'should get edit' do
    get edit_invoice_url(@invoice)
    assert_response :success
  end

  test 'should update invoice' do
    patch invoice_url(@invoice), params: { invoice: { amount: @invoice.amount, cash_id: @invoice.cash_id, date: @invoice.date, detail: @invoice.detail, gross_income_perception_amount: @invoice.gross_income_perception_amount, invoice_type_id: @invoice.invoice_type_id, number: @invoice.number, payment_method_id: @invoice.payment_method_id, payment_type_id: @invoice.payment_type_id, subtotal: @invoice.subtotal, supplier_id: @invoice.supplier_id, tax_amount: @invoice.tax_amount, tax_condition_id: @invoice.tax_condition_id, tax_perception_amount: @invoice.tax_perception_amount } }
    assert_redirected_to invoice_url(@invoice)
  end

  test 'should destroy invoice' do
    assert_difference('Invoice.count', -1) do
      delete invoice_url(@invoice)
    end

    assert_redirected_to invoices_url
  end
end

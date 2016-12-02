require 'test_helper'

class Cashes::InvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice = invoices :default
    @cash = @invoice.cash

    login
  end

  test 'should get index' do
    get cash_invoices_url(@cash), xhr: true
    assert_response :success
  end

  test 'should get new' do
    get new_cash_invoice_url(@cash), xhr: true
    assert_response :success
  end

  test 'should create invoice' do
    assert_difference('Invoice.count') do
      post cash_invoices_url(@cash), xhr: true, params: {
        invoice: {
          amount: @invoice.amount,
          date: @invoice.date,
          detail: @invoice.detail,
          gross_income_perception_amount: @invoice.gross_income_perception_amount,
          invoice_type_id: @invoice.invoice_type_id,
          number: '0001-09808908',
          payment_method_id: @invoice.payment_method_id,
          expense_type_id: @invoice.expense_type_id,
          subtotal: @invoice.subtotal,
          supplier_id: @invoice.supplier_id,
          tax_amount: @invoice.tax_amount,
          tax_condition_id: @invoice.tax_condition_id,
          tax_perception_amount: @invoice.tax_perception_amount
        }
      }
    end

    assert_response :success
    assert_no_match(/has-error/, @response.body)
  end

  test 'should get edit' do
    get edit_cash_invoice_url(@cash, @invoice), xhr: true
    assert_response :success
  end

  test 'should update invoice' do
    patch cash_invoice_url(@cash, @invoice), xhr: true, params: { invoice: { subtotal: 1200, amount: 1500 } }
    assert_response :success
    assert_no_match(/has-error/, @response.body)
  end

  test 'should destroy invoice' do
    assert_difference('Invoice.count', -1) do
      delete cash_invoice_url(@cash, @invoice), xhr: true
    end

    assert_response :success
    assert_no_match(/has-error/, @response.body)
  end
end

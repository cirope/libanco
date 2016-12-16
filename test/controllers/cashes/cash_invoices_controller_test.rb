require 'test_helper'

class Cashes::CashInvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cash_invoice = cash_invoices :default
    @cash = @cash_invoice.cash

    login
  end

  test 'should get index' do
    get cash_cash_invoices_url(@cash), xhr: true
    assert_response :success
  end

  test 'should get new' do
    get new_cash_cash_invoice_url(@cash), xhr: true
    assert_response :success
  end

  test 'should create cash_invoice' do
    assert_difference('CashInvoice.count') do
      post cash_cash_invoices_url(@cash), xhr: true, params: {
        cash_invoice: {
          amount: @cash_invoice.amount,
          date: @cash_invoice.date,
          detail: @cash_invoice.detail,
          gross_income_perception_amount: @cash_invoice.gross_income_perception_amount,
          invoice_type_id: @cash_invoice.invoice_type_id,
          number: '0001-09808908',
          payment_method_id: @cash_invoice.payment_method_id,
          expense_type_id: @cash_invoice.expense_type_id,
          subtotal: @cash_invoice.subtotal,
          supplier_id: @cash_invoice.supplier_id,
          tax_amount: @cash_invoice.tax_amount,
          tax_condition_id: @cash_invoice.tax_condition_id,
          tax_perception_amount: @cash_invoice.tax_perception_amount
        }
      }
    end

    assert_response :success
    assert_no_match(/has-error/, @response.body)
  end

  test 'should get edit' do
    get edit_cash_cash_invoice_url(@cash, @cash_invoice), xhr: true
    assert_response :success
  end

  test 'should update cash_invoice' do
    patch cash_cash_invoice_url(@cash, @cash_invoice), xhr: true,
      params: { cash_invoice: { subtotal: 1200, amount: 1500 } }
    assert_response :success
    assert_no_match(/has-error/, @response.body)
  end

  test 'should destroy cash_invoice' do
    assert_difference('CashInvoice.count', -1) do
      delete cash_cash_invoice_url(@cash, @cash_invoice), xhr: true
    end

    assert_response :success
    assert_no_match(/has-error/, @response.body)
  end
end

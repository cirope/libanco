require 'test_helper'

class InvoiceTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice_type = invoice_types :default

    login
  end

  test 'should get index' do
    get invoice_types_url
    assert_response :success
  end

  test 'should get new' do
    get new_invoice_type_url
    assert_response :success
  end

  test 'should create invoice_type' do
    assert_difference('InvoiceType.count') do
      post invoice_types_url, params: { invoice_type: { name: 'New Invoice Type' } }
    end

    assert_redirected_to invoice_types_url
  end

  test 'should get edit' do
    get edit_invoice_type_url(@invoice_type)
    assert_response :success
  end

  test 'should update invoice_type' do
    patch invoice_type_url(@invoice_type), params: { invoice_type: { name: 'Invoice Type updated' } }
    assert_redirected_to invoice_types_url
  end
end

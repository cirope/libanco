require 'test_helper'

class CashMemberPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cash_member_payment = cash_member_payments :default

    login
  end

  test 'should get index' do
    get cash_member_payments_url
    assert_response :success
  end

  test 'should get new' do
    get new_cash_member_payment_url
    assert_response :success
  end

  test 'should create cash_member_payment' do
    assert_difference('CashMemberPayment.count') do
      post cash_member_payments_url, params: { cash_member_payment: { cash_id: @cash_member_payment.cash_id, member_payment_id: @cash_member_payment.member_payment_id, user_id: @cash_member_payment.user_id } }
    end

    assert_redirected_to cash_member_payment_url(CashMemberPayment.last)
  end

  test 'should get edit' do
    get edit_cash_member_payment_url(@cash_member_payment)
    assert_response :success
  end

  test 'should update cash_member_payment' do
    patch cash_member_payment_url(@cash_member_payment), params: { cash_member_payment: { cash_id: @cash_member_payment.cash_id, member_payment_id: @cash_member_payment.member_payment_id, user_id: @cash_member_payment.user_id } }
    assert_redirected_to cash_member_payment_url(@cash_member_payment)
  end

  test 'should destroy cash_member_payment' do
    assert_difference('CashMemberPayment.count', -1) do
      delete cash_member_payment_url(@cash_member_payment)
    end

    assert_redirected_to cash_member_payments_url
  end
end

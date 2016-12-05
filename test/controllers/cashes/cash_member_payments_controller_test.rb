require 'test_helper'

class Cashes::CashMemberPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cash_member_payment = cash_member_payments :default
    @cash = @cash_member_payment.cash

    login
  end

  test 'should get index' do
    get cash_cash_member_payments_url(@cash), xhr: true
    assert_response :success
  end

  test 'should get new' do
    get new_cash_cash_member_payment_url(@cash), xhr: true
    assert_response :success
  end

  test 'should create cash_member_payment' do
    assert_difference('CashMemberPayment.count') do
      post cash_cash_member_payments_url(@cash), xhr: true,
        params: {
          cash_member_payment: { customer_id: customers(:default).id },
          member_payments_ids: [ member_payments(:default).id ]
        }
    end
    assert_response :success
    assert_no_match(/alert-danger/, @response.body)
  end

  test 'should destroy cash_member_payment' do
    assert_difference('CashMemberPayment.count', -1) do
      delete cash_cash_member_payment_url(@cash, @cash_member_payment), xhr: true
    end
    assert_response :success
  end
end

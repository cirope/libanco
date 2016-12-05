require 'test_helper'

class Cashes::CashPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cash_payment = cash_payments :default
    @cash = @cash_payment.cash

    login
  end

  test 'should get index' do
    get cash_cash_payments_url(@cash), xhr: true
    assert_response :success
  end

  test 'should get new' do
    get new_cash_cash_payment_url(@cash), xhr: true
    assert_response :success
  end

  test 'should create cash_payment' do
    assert_difference('CashPayment.count') do
      post cash_cash_payments_url(@cash), xhr: true,
        params: {
          cash_payment: { customer_id: customers(:default).id },
          payments_ids: [ payments(:default).id ]
        }
    end
    assert_response :success
  end

  test 'should destroy cash_payment' do
    assert_difference('CashPayment.count', -1) do
      delete cash_cash_payment_url(@cash, @cash_payment), xhr: true
    end
    assert_response :success
  end
end

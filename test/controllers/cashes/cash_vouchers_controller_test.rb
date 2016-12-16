require 'test_helper'

class Cashes::CashVouchersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cash_voucher = cash_vouchers :default
    @cash = @cash_voucher.cash

    login
  end

  test 'should get index' do
    get cash_cash_vouchers_url(@cash), xhr: true
    assert_response :success
  end

  test 'should get new' do
    get new_cash_cash_voucher_url(@cash), xhr: true
    assert_response :success
  end

  test 'should create cash_voucher' do
    assert_difference('CashVoucher.count') do
      post cash_cash_vouchers_url(@cash), xhr: true, params: {
        cash_voucher: {
          kind: @cash_voucher.kind,
          owner_type: @cash_voucher.owner_type,
          owner_id: @cash_voucher.owner_id,
          amount: @cash_voucher.amount,
          comment: @cash_voucher.comment
        }
      }
    end

    assert_response :success
    assert_no_match(/has-error/, @response.body)
  end

  test 'should get edit' do
    get edit_cash_cash_voucher_url(@cash, @cash_voucher), xhr: true
    assert_response :success
  end

  test 'should update cash_voucher' do
    patch cash_cash_voucher_url(@cash, @cash_voucher), xhr: true, params: { cash_voucher: { amount: 1000 } }
    assert_response :success
    assert_no_match(/has-error/, @response.body)
  end

  test 'should destroy cash_voucher' do
    assert_difference('CashVoucher.count', -1) do
      delete cash_cash_voucher_url(@cash, @cash_voucher), xhr: true
    end

    assert_response :success
  end
end

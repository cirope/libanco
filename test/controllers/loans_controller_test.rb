require 'test_helper'

class LoansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan = loans :default

    login
  end

  test 'should get index' do
    get loans_url
    assert_response :success
  end

  test 'should get new' do
    get new_loan_url
    assert_response :success
  end

  test 'should create loan' do
    assert_difference 'Loan.count' do
      post loans_url, params: {
        loan: {
          amortization_system: @loan.amortization_system,
          amount: @loan.amount,
          credit_line_id: @loan.credit_line_id,
          customer_id: @loan.customer_id,
          payments_count: @loan.payments_count,
          payment_frequency: @loan.payment_frequency
        }
      }
    end

    assert_redirected_to loan_url(Loan.unscoped.last)
  end

  test 'should show loan' do
    get loan_url(@loan)
    assert_response :success
  end

  test 'should get edit' do
    get edit_loan_url(@loan)
    assert_response :success
  end

  test 'should update loan' do
    patch loan_url(@loan), params: { loan: { amount: 5000 } }
    assert_redirected_to loan_url(@loan)
  end

  test 'should destroy loan' do
    assert_difference('Loan.count', -1) do
      delete loan_url(@loan)
    end

    assert_redirected_to loans_url
  end
end

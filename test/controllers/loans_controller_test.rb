require 'test_helper'

class LoansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan = loans(:one)
  end

  test "should get index" do
    get loans_url
    assert_response :success
  end

  test "should get new" do
    get new_loan_url
    assert_response :success
  end

  test "should create loan" do
    assert_difference('Loan.count') do
      post loans_url, params: { loan: { amortization_system: @loan.amortization_system, amount: @loan.amount, amount_total: @loan.amount_total, canceled_at: @loan.canceled_at, commission_amount: @loan.commission_amount, credit_line: @loan.credit_line, customer_id: @loan.customer_id, expired_at: @loan.expired_at, gross_income_perception_amount: @loan.gross_income_perception_amount, insurance_amount: @loan.insurance_amount, interest_amount: @loan.interest_amount, payment: @loan.payment, payments_count: @loan.payments_count, progress: @loan.progress, stamped_amount: @loan.stamped_amount, status: @loan.status, tax_amount: @loan.tax_amount, tax_perception_amount: @loan.tax_perception_amount } }
    end

    assert_redirected_to loan_url(Loan.last)
  end

  test "should show loan" do
    get loan_url(@loan)
    assert_response :success
  end

  test "should get edit" do
    get edit_loan_url(@loan)
    assert_response :success
  end

  test "should update loan" do
    patch loan_url(@loan), params: { loan: { amortization_system: @loan.amortization_system, amount: @loan.amount, amount_total: @loan.amount_total, canceled_at: @loan.canceled_at, commission_amount: @loan.commission_amount, credit_line: @loan.credit_line, customer_id: @loan.customer_id, expired_at: @loan.expired_at, gross_income_perception_amount: @loan.gross_income_perception_amount, insurance_amount: @loan.insurance_amount, interest_amount: @loan.interest_amount, payment: @loan.payment, payments_count: @loan.payments_count, progress: @loan.progress, stamped_amount: @loan.stamped_amount, status: @loan.status, tax_amount: @loan.tax_amount, tax_perception_amount: @loan.tax_perception_amount } }
    assert_redirected_to loan_url(@loan)
  end

  test "should destroy loan" do
    assert_difference('Loan.count', -1) do
      delete loan_url(@loan)
    end

    assert_redirected_to loans_url
  end
end

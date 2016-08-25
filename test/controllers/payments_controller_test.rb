require 'test_helper'

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment = payments(:one)
  end

  test "should get index" do
    get payments_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_url
    assert_response :success
  end

  test "should create payment" do
    assert_difference('Payment.count') do
      post payments_url, params: { payment: { amount: @payment.amount, balance: @payment.balance, capital: @payment.capital, expire_at: @payment.expire_at, gross_income_perception: @payment.gross_income_perception, insurance: @payment.insurance, interest: @payment.interest, loan_id: @payment.loan_id, number: @payment.number, paid_at: @payment.paid_at, tax: @payment.tax, tax_perception: @payment.tax_perception } }
    end

    assert_redirected_to payment_url(Payment.last)
  end

  test "should show payment" do
    get payment_url(@payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_url(@payment)
    assert_response :success
  end

  test "should update payment" do
    patch payment_url(@payment), params: { payment: { amount: @payment.amount, balance: @payment.balance, capital: @payment.capital, expire_at: @payment.expire_at, gross_income_perception: @payment.gross_income_perception, insurance: @payment.insurance, interest: @payment.interest, loan_id: @payment.loan_id, number: @payment.number, paid_at: @payment.paid_at, tax: @payment.tax, tax_perception: @payment.tax_perception } }
    assert_redirected_to payment_url(@payment)
  end

  test "should destroy payment" do
    assert_difference('Payment.count', -1) do
      delete payment_url(@payment)
    end

    assert_redirected_to payments_url
  end
end

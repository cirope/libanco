require 'test_helper'

class MemberPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member_payment = member_payments(:one)
  end

  test "should get index" do
    get member_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_member_payment_url
    assert_response :success
  end

  test "should create member_payment" do
    assert_difference('MemberPayment.count') do
      post member_payments_url, params: { member_payment: { amount: @member_payment.amount, customer_id: @member_payment.customer_id, expire_at: @member_payment.expire_at, paid_at: @member_payment.paid_at } }
    end

    assert_redirected_to member_payment_url(MemberPayment.last)
  end

  test "should show member_payment" do
    get member_payment_url(@member_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_member_payment_url(@member_payment)
    assert_response :success
  end

  test "should update member_payment" do
    patch member_payment_url(@member_payment), params: { member_payment: { amount: @member_payment.amount, customer_id: @member_payment.customer_id, expire_at: @member_payment.expire_at, paid_at: @member_payment.paid_at } }
    assert_redirected_to member_payment_url(@member_payment)
  end

  test "should destroy member_payment" do
    assert_difference('MemberPayment.count', -1) do
      delete member_payment_url(@member_payment)
    end

    assert_redirected_to member_payments_url
  end
end

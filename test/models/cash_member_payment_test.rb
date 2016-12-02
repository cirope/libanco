require 'test_helper'

class CashMemberPaymentTest < ActiveSupport::TestCase
  def setup
    @member_payment = member_payments :unpaid
  end

  test 'should paid member payment' do
    assert @member_payment.paid_at.nil?

    CashMemberPayment.create!(
      customer: @member_payment.customer,
      member_payment: @member_payment,
      user: users(:cashier),
      cash: cashes(:default)
    )

    assert @member_payment.paid_at
  end
end

require 'test_helper'

class MemberPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member_payment = member_payments :default

    login
  end

  test "should get index" do
    get member_payments_url
    assert_response :success
  end
end

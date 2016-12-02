require 'test_helper'

class MemberPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers :default

    login
  end

  test 'should get index' do
    get customer_member_payments_url(@customer), xhr: true
    assert_response :success
  end
end

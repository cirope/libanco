require 'test_helper'

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers :default

    login
  end

  test 'should get index' do
    get customer_payments_url(@customer), xhr: true
    assert_response :success
  end
end

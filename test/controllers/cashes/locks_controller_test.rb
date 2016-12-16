require 'test_helper'

class Cashes::LocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cash = cashes :default

    login
  end

  test 'should get update' do
    patch cash_lock_url(@cash)
    assert_redirected_to cashes_url
  end

  test 'should get destroy' do
    delete cash_lock_url(@cash)
    assert_redirected_to cash_flows_url(@cash)
  end
end

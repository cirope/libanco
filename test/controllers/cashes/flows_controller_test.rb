require 'test_helper'

class Cashes::FlowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cash = cashes :default

    login
  end

  test 'should get index' do
    get cash_flows_url(@cash)
    assert_response :success
  end
end

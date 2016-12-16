require 'test_helper'

class Cashes::CountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cash = cashes :default

    login
  end

  test 'should get edit' do
    get edit_cash_counts_url(@cash), xhr: true
    assert_response :success
  end

  test 'should get update' do
    patch cash_counts_url(@cash), xhr: true, params: { cash: { closing_balance: 2000 } }
    assert_response :success
    assert_no_match(/has-error/, @response.body)
  end
end

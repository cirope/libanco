require 'test_helper'

class Customers::SearchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
  end

  test 'should get index' do
    get customers_searches_url, xhr: true, as: :json
    assert_response :success
  end
end

require 'test_helper'

class Customers::SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_searches_index_url
    assert_response :success
  end

end

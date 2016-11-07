require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
  end

  test "should get index" do
    get reports_url
    assert_response :success
  end
end

require 'test_helper'

class CustomTemplates::GeneratesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get custom_templates_generates_show_url
    assert_response :success
  end

end

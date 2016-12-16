require 'test_helper'

class Employees::SearchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
  end

  test 'should get index' do
    get employees_searches_url, xhr: true, as: :json
    assert_response :success
  end
end

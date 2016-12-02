require 'test_helper'

class Suppliers::SearchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
  end

  test 'should get index' do
    get suppliers_searches_url, xhr: true, as: :json
    assert_response :success
  end
end

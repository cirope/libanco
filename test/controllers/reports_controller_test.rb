require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
  end

  test 'should get index' do
    get reports_url
    assert_response :success
  end

  test 'should get mp all' do
    get reports_url, params: { report: { filter: 'mp_all' } }
    assert_response :success
  end

  test 'should get mp expired' do
    get reports_url, params: { report: { filter: 'mp_expired' } }
    assert_response :success
  end

  test 'should get invoice' do
    get reports_url, params: { report: { filter: 'invoice' } }
    assert_response :success
  end
end

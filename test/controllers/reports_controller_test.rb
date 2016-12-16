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

  test 'should get p all' do
    get reports_url, params: { report: { filter: 'p_all' } }
    assert_response :success
  end

  test 'should get p expired' do
    get reports_url, params: { report: { filter: 'p_expired' } }
    assert_response :success
  end

  test 'should get cash invoice' do
    get reports_url, params: { report: { filter: 'cash_invoice' } }
    assert_response :success
  end

  test 'should get cash employee' do
    get reports_url, params: { report: { filter: 'cash_employee' } }
    assert_response :success
  end
end

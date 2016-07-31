require 'test_helper'

class MaritalStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @marital_status = marital_statuses :default

    login
  end

  test 'should get index' do
    get marital_statuses_url
    assert_response :success
  end

  test 'should get new' do
    get new_marital_status_url
    assert_response :success
  end

  test 'should create marital_status' do
    assert_difference('MaritalStatus.count') do
      post marital_statuses_url, params: { marital_status: { name: 'New marital status' } }
    end

    assert_redirected_to marital_statuses_url
  end

  test 'should get edit' do
    get edit_marital_status_url(@marital_status)
    assert_response :success
  end

  test 'should update marital_status' do
    patch marital_status_url(@marital_status), params: { marital_status: { name: 'MS updated' } }
    assert_redirected_to marital_statuses_url
  end
end

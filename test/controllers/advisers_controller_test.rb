require 'test_helper'

class AdvisersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adviser = advisers :default

    login
  end

  test 'should get index' do
    get advisers_url
    assert_response :success
  end

  test 'should get new' do
    get new_adviser_url
    assert_response :success
  end

  test 'should create adviser' do
    assert_difference('Adviser.count') do
      post advisers_url, params: { adviser: { name: 'New name' } }
    end

    assert_redirected_to advisers_url
  end

  test 'should get edit' do
    get edit_adviser_url(@adviser)
    assert_response :success
  end

  test 'should update adviser' do
    patch adviser_url(@adviser), params: { adviser: { name: 'Adviser updated' } }
    assert_redirected_to advisers_url
  end
end

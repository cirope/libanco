require 'test_helper'

class StatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @state = states :default

    login
  end

  test 'should get index' do
    get states_url
    assert_response :success
  end

  test 'should get new' do
    get new_state_url
    assert_response :success
  end

  test 'should create state' do
    assert_difference('State.count') do
      post states_url, params: { state: { name: 'New state' } }
    end

    assert_redirected_to states_url
  end

  test 'should get edit' do
    get edit_state_url(@state)
    assert_response :success
  end

  test 'should update state' do
    patch state_url(@state), params: { state: { name: 'State updated' } }
    assert_redirected_to states_url
  end
end

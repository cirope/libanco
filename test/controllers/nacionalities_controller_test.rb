require 'test_helper'

class NacionalitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nacionality = nacionalities :default

    login
  end

  test 'should get index' do
    get nacionalities_url
    assert_response :success
  end

  test 'should get new' do
    get new_nacionality_url
    assert_response :success
  end

  test 'should create nacionality' do
    assert_difference('Nacionality.count') do
      post nacionalities_url, params: { nacionality: { name: 'New nacionality' } }
    end

    assert_redirected_to nacionalities_url
  end

  test 'should get edit' do
    get edit_nacionality_url(@nacionality)
    assert_response :success
  end

  test 'should update nacionality' do
    patch nacionality_url(@nacionality), params: { nacionality: { name: 'Name updated' } }
    assert_redirected_to nacionalities_url
  end
end

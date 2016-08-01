require 'test_helper'

class NeighborhoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @neighborhood = neighborhoods :default

    login
  end

  test 'should get index' do
    get neighborhoods_url
    assert_response :success
  end

  test 'should get new' do
    get new_neighborhood_url
    assert_response :success
  end

  test 'should create neighborhood' do
    assert_difference('Neighborhood.count') do
      post neighborhoods_url, params: { neighborhood: { name: 'ISO' } }
    end

    assert_redirected_to neighborhoods_url
  end

  test 'should get edit' do
    get edit_neighborhood_url(@neighborhood)
    assert_response :success
  end

  test 'should update neighborhood' do
    patch neighborhood_url(@neighborhood), params: { neighborhood: { name: 'ISO updated' } }
    assert_redirected_to neighborhoods_url
  end
end

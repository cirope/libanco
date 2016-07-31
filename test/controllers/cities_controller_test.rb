require 'test_helper'

class CitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @city = cities :default

    login
  end

  test 'should get index' do
    get cities_url
    assert_response :success
  end

  test 'should get new' do
    get new_city_url
    assert_response :success
  end

  test 'should create city' do
    assert_difference('City.count') do
      post cities_url, params: { city: { name: 'New city', state_id: @city.state_id } }
    end

    assert_redirected_to cities_url
  end

  test 'should get edit' do
    get edit_city_url(@city)
    assert_response :success
  end

  test 'should update city' do
    patch city_url(@city), params: { city: { name: 'City Updated', state_id: @city.state_id } }
    assert_redirected_to cities_url
  end
end

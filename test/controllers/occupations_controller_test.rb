require 'test_helper'

class OccupationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @occupation = occupations :default

    login
  end

  test 'should get index' do
    get occupations_url
    assert_response :success
  end

  test 'should get new' do
    get new_occupation_url
    assert_response :success
  end

  test 'should create occupation' do
    assert_difference('Occupation.count') do
      post occupations_url, params: { occupation: { name: 'New occupation' } }
    end

    assert_redirected_to occupations_url
  end

  test 'should get edit' do
    get edit_occupation_url(@occupation)
    assert_response :success
  end

  test 'should update occupation' do
    patch occupation_url(@occupation), params: { occupation: { name: 'Occupation updated' } }
    assert_redirected_to occupations_url
  end
end

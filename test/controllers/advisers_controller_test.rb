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
      post advisers_url, params: { adviser: {
        identification: 2757465,
        identification_type: @adviser.identification_type,
        lastname: @adviser.lastname,
        name: @adviser.name,
        phone: @adviser.phone }
      }
    end

    assert_redirected_to adviser_url(Adviser.unscoped.last)
  end

  test 'should show adviser' do
    get adviser_url(@adviser)
    assert_response :success
  end

  test 'should get edit' do
    get edit_adviser_url(@adviser)
    assert_response :success
  end

  test 'should update adviser' do
    patch adviser_url(@adviser), params: { adviser: { name: 'Adviser updated' } }
    assert_redirected_to adviser_url(@adviser)
  end
end

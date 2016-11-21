require 'test_helper'

class ConsultantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consultant = consultants :default

    login
  end

  test 'should get index' do
    get consultants_url
    assert_response :success
  end

  test 'should get new' do
    get new_consultant_url
    assert_response :success
  end

  test 'should create consultant' do
    assert_difference('Consultant.count') do
      post consultants_url, params: { consultant: { name: 'New Consultant' } }
    end

    assert_redirected_to consultants_url
  end

  test 'should get edit' do
    get edit_consultant_url(@consultant)
    assert_response :success
  end

  test 'should update consultant' do
    patch consultant_url(@consultant), params: { consultant: { name: 'Consultant updated' } }
    assert_redirected_to consultants_url
  end
end

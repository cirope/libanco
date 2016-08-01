require 'test_helper'

class InstitutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @institution = institutions :default

    login
  end

  test 'should get index' do
    get institutions_url
    assert_response :success
  end

  test 'should get new' do
    get new_institution_url
    assert_response :success
  end

  test 'should create institution' do
    assert_difference('Institution.count') do
      post institutions_url, params: { institution: { name: 'New institution' } }
    end

    assert_redirected_to institutions_url
  end

  test 'should get edit' do
    get edit_institution_url(@institution)
    assert_response :success
  end

  test 'should update institution' do
    patch institution_url(@institution), params: { institution: { name: 'Institution updated' } }
    assert_redirected_to institutions_url
  end
end

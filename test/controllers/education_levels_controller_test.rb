require 'test_helper'

class EducationLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @education_level = education_levels :default

    login
  end

  test 'should get index' do
    get education_levels_url
    assert_response :success
  end

  test 'should get new' do
    get new_education_level_url
    assert_response :success
  end

  test 'should create education_level' do
    assert_difference('EducationLevel.count') do
      post education_levels_url, params: { education_level: { name: 'New ELevel' } }
    end

    assert_redirected_to education_levels_url
  end

  test 'should get edit' do
    get edit_education_level_url(@education_level)
    assert_response :success
  end

  test 'should update education_level' do
    patch education_level_url(@education_level), params: { education_level: { name: 'ELevel updated' } }
    assert_redirected_to education_levels_url
  end
end

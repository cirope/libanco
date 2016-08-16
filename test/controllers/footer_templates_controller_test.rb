require 'test_helper'

class FooterTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @footer_template = footer_templates :default

    login
  end

  test 'should get index' do
    get footer_templates_url
    assert_response :success
  end

  test 'should get new' do
    get new_footer_template_url
    assert_response :success
  end

  test 'should create footer_template' do
    assert_difference('FooterTemplate.count') do
      post footer_templates_url, params: {
        footer_template: {
          name: 'Footer name',
          content: @footer_template.content
        }
      }
    end

    assert_redirected_to footer_template_url(FooterTemplate.unscoped.last)
  end

  test 'should show footer_template' do
    get footer_template_url(@footer_template)
    assert_response :success
  end

  test 'should get edit' do
    get edit_footer_template_url(@footer_template)
    assert_response :success
  end

  test 'should update footer_template' do
    patch footer_template_url(@footer_template), params: { footer_template: { name: 'Name updated' } }
    assert_redirected_to footer_template_url(@footer_template)
  end
end

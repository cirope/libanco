require 'test_helper'

class HeaderTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @header_template = header_templates :default

    login
  end

  test 'should get index' do
    get header_templates_url
    assert_response :success
  end

  test 'should get new' do
    get new_header_template_url
    assert_response :success
  end

  test 'should create header_template' do
    assert_difference('HeaderTemplate.count') do
      post header_templates_url, params: {
        header_template: {
          name: 'Header name',
          content: @header_template.content
        }
      }
    end

    assert_redirected_to header_template_url(HeaderTemplate.unscoped.last)
  end

  test 'should show header_template' do
    get header_template_url(@header_template)
    assert_response :success
  end

  test 'should get edit' do
    get edit_header_template_url(@header_template)
    assert_response :success
  end

  test 'should update header_template' do
    patch header_template_url(@header_template), params: { header_template: { name: 'Name updated' } }
    assert_redirected_to header_template_url(@header_template)
  end
end

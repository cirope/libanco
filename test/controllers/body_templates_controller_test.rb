require 'test_helper'

class BodyTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @body_template = body_templates :default

    login
  end

  test 'should get index' do
    get body_templates_url
    assert_response :success
  end

  test 'should get new' do
    get new_body_template_url
    assert_response :success
  end

  test 'should create body_template' do
    assert_difference('BodyTemplate.count') do
      post body_templates_url, params: {
        body_template: {
          name: 'Body name',
          content: @body_template.content
        }
      }
    end

    assert_redirected_to body_template_url(BodyTemplate.unscoped.last)
  end

  test 'should show body_template' do
    get body_template_url(@body_template)
    assert_response :success
  end

  test 'should get edit' do
    get edit_body_template_url(@body_template)
    assert_response :success
  end

  test 'should update body_template' do
    patch body_template_url(@body_template), params: { body_template: { name: 'Name updated' } }
    assert_redirected_to body_template_url(@body_template)
  end
end

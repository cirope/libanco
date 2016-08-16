require 'test_helper'

class HeaderTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @header_template = header_templates(:one)
  end

  test "should get index" do
    get header_templates_url
    assert_response :success
  end

  test "should get new" do
    get new_header_template_url
    assert_response :success
  end

  test "should create header_template" do
    assert_difference('HeaderTemplate.count') do
      post header_templates_url, params: { header_template: { content: @header_template.content, image: @header_template.image, name: @header_template.name } }
    end

    assert_redirected_to header_template_url(HeaderTemplate.last)
  end

  test "should show header_template" do
    get header_template_url(@header_template)
    assert_response :success
  end

  test "should get edit" do
    get edit_header_template_url(@header_template)
    assert_response :success
  end

  test "should update header_template" do
    patch header_template_url(@header_template), params: { header_template: { content: @header_template.content, image: @header_template.image, name: @header_template.name } }
    assert_redirected_to header_template_url(@header_template)
  end

  test "should destroy header_template" do
    assert_difference('HeaderTemplate.count', -1) do
      delete header_template_url(@header_template)
    end

    assert_redirected_to header_templates_url
  end
end

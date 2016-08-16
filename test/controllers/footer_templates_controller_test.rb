require 'test_helper'

class FooterTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @footer_template = footer_templates(:one)
  end

  test "should get index" do
    get footer_templates_url
    assert_response :success
  end

  test "should get new" do
    get new_footer_template_url
    assert_response :success
  end

  test "should create footer_template" do
    assert_difference('FooterTemplate.count') do
      post footer_templates_url, params: { footer_template: { content: @footer_template.content, name: @footer_template.name } }
    end

    assert_redirected_to footer_template_url(FooterTemplate.last)
  end

  test "should show footer_template" do
    get footer_template_url(@footer_template)
    assert_response :success
  end

  test "should get edit" do
    get edit_footer_template_url(@footer_template)
    assert_response :success
  end

  test "should update footer_template" do
    patch footer_template_url(@footer_template), params: { footer_template: { content: @footer_template.content, name: @footer_template.name } }
    assert_redirected_to footer_template_url(@footer_template)
  end

  test "should destroy footer_template" do
    assert_difference('FooterTemplate.count', -1) do
      delete footer_template_url(@footer_template)
    end

    assert_redirected_to footer_templates_url
  end
end

require 'test_helper'

class CustomTemplates::VariablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
  end

  test 'should get index' do
    get custom_templates_variables_url, params: { kind: 'customer' }, xhr: true
    assert_response :success
  end
end

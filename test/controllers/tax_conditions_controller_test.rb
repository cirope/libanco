require 'test_helper'

class TaxConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tax_condition = tax_conditions :default

    login
  end

  test 'should get index' do
    get tax_conditions_url
    assert_response :success
  end

  test 'should get new' do
    get new_tax_condition_url
    assert_response :success
  end

  test 'should create tax_condition' do
    assert_difference('TaxCondition.count') do
      post tax_conditions_url, params: { tax_condition: { name: 'New tax condition' } }
    end

    assert_redirected_to tax_conditions_url
  end

  test 'should get edit' do
    get edit_tax_condition_url(@tax_condition)
    assert_response :success
  end

  test 'should update tax_condition' do
    patch tax_condition_url(@tax_condition), params: { tax_condition: { name: 'Tax Cond. Updated' } }
    assert_redirected_to tax_conditions_url
  end
end

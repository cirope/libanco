require 'test_helper'

class InvestmentGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @investment_group = investment_groups :default

    login
  end

  test 'should get index' do
    get investment_groups_url
    assert_response :success
  end

  test 'should get new' do
    get new_investment_group_url
    assert_response :success
  end

  test 'should create investment_group' do
    assert_difference 'InvestmentGroup.count' do
      post investment_groups_url, params: { investment_group: { name: 'New Investment Group' } }
    end

    assert_redirected_to investment_groups_url
  end

  test 'should get edit' do
    get edit_investment_group_url(@investment_group)
    assert_response :success
  end

  test 'should update investment_group' do
    patch investment_group_url(@investment_group), params: { investment_group: { name: 'Investment Group Updated' } }
    assert_redirected_to investment_groups_url
  end
end

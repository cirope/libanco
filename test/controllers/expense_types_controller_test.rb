require 'test_helper'

class ExpenseTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expense_type = expense_types :default

    login
  end

  test 'should get index' do
    get expense_types_url
    assert_response :success
  end

  test 'should get new' do
    get new_expense_type_url
    assert_response :success
  end

  test 'should create expense_type' do
    assert_difference('ExpenseType.count') do
      post expense_types_url, params: { expense_type: { name: 'New Expense Type' } }
    end

    assert_redirected_to expense_types_url
  end

  test 'should get edit' do
    get edit_expense_type_url(@expense_type)
    assert_response :success
  end

  test 'should update expense_type' do
    patch expense_type_url(@expense_type), params: { expense_type: { name: 'Expense Type Updated' } }
    assert_redirected_to expense_types_url
  end
end

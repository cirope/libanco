require 'test_helper'

class LoanTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan_type = loan_types :default

    login
  end

  test 'should get index' do
    get loan_types_url
    assert_response :success
  end

  test 'should get new' do
    get new_loan_type_url
    assert_response :success
  end

  test 'should create loan_type' do
    assert_difference('LoanType.count') do
      post loan_types_url, params: {
        loan_type: {
          name: 'New name',
          annual_percentage: @loan_type.annual_percentage,
          initial_percentage: @loan_type.initial_percentage
        }
      }
    end

    assert_redirected_to loan_types_url
  end

  test 'should get edit' do
    get edit_loan_type_url(@loan_type)
    assert_response :success
  end

  test 'should update loan_type' do
    patch loan_type_url(@loan_type), params: { loan_type: { name: 'Name updated' } }
    assert_redirected_to loan_types_url
  end
end

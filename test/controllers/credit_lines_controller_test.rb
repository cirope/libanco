require 'test_helper'

class CreditLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @credit_line = credit_lines :default

    login
  end

  test 'should get index' do
    get credit_lines_url
    assert_response :success
  end

  test 'should get new' do
    get new_credit_line_url
    assert_response :success
  end

  test 'should create credit_line' do
    assert_difference('CreditLine.count') do
      post credit_lines_url, params: {
        credit_line: {
          commission: @credit_line.commission,
          commission_max: @credit_line.commission_max,
          gross_income_perception: @credit_line.gross_income_perception,
          gross_income_perception_min: @credit_line.gross_income_perception_min,
          insurance: @credit_line.insurance,
          interest: @credit_line.interest,
          name: 'New credit line',
          stamped: @credit_line.stamped,
          tax: @credit_line.tax,
          tax_perception: @credit_line.tax_perception
        }
      }
    end

    assert_redirected_to credit_lines_url
  end

  test 'should get edit' do
    get edit_credit_line_url(@credit_line)
    assert_response :success
  end

  test 'should update credit_line' do
    patch credit_line_url(@credit_line), params: { credit_line: { name: 'Name updated' } }
    assert_redirected_to credit_lines_url
  end
end

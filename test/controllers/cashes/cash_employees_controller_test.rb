require 'test_helper'

class Cashes::CashEmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cash_employee = cash_employees :default
    @cash = @cash_employee.cash

    login
  end

  test 'should get index' do
    get cash_cash_employees_url(@cash), xhr: true
    assert_response :success
  end

  test 'should get new' do
    get new_cash_cash_employee_url(@cash), xhr: true
    assert_response :success
  end

  test 'should create cash_employee' do
    assert_difference('CashEmployee.count') do
      post cash_cash_employees_url(@cash), xhr: true, params: {
        cash_employee: {
          amount: @cash_employee.amount,
          period: 2.month.ago,
          employee_id: @cash_employee.employee_id
        }
      }
    end

    assert_response :success
    assert_no_match(/has-error/, @response.body)
  end

  test 'should get edit' do
    get edit_cash_cash_employee_url(@cash, @cash_employee), xhr: true
    assert_response :success
  end

  test 'should update cash_employee' do
    patch cash_cash_employee_url(@cash, @cash_employee), xhr: true, params: { cash_employee: { amount: 3000 } }
    assert_response :success
    assert_no_match(/has-error/, @response.body)
  end

  test 'should destroy cash_employee' do
    assert_difference('CashEmployee.count', -1) do
      delete cash_cash_employee_url(@cash, @cash_employee), xhr: true
    end

    assert_response :success
  end
end

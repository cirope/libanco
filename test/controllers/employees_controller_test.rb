require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees :default

    login
  end

  test 'should get index' do
    get employees_url
    assert_response :success
  end

  test 'should get new' do
    get new_employee_url
    assert_response :success
  end

  test 'should create employee' do
    assert_difference('Employee.count') do
      post employees_url, params: {
        employee: {
          tax_id: '20-23678567-2',
          name: @employee.name,
          lastname: @employee.lastname
        }
      }
    end

    assert_redirected_to employees_url
  end

  test 'should get edit' do
    get edit_employee_url(@employee)
    assert_response :success
  end

  test 'should update employee' do
    patch employee_url(@employee), params: { employee: { tax_id: '22-30543345-4' } }
    assert_redirected_to employees_url
  end
end

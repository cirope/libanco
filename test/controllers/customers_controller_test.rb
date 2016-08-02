require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers :default

    login
  end

  test 'should get index' do
    get customers_url
    assert_response :success
  end

  test 'should get new' do
    get new_customer_url
    assert_response :success
  end

  test 'should create customer' do
    assert_difference('Customer.count') do
      post customers_url, params: {
        customer: {
          address: @customer.address,
          birthdate: @customer.birthdate,
          state_id: @customer.state_id,
          city_id: @customer.city_id,
          education_level_id: @customer.education_level_id,
          email: @customer.email,
          identification: 25678676,
          identification_type: 'dni',
          adviser_id: @customer.adviser_id,
          lastname: @customer.lastname,
          place_birth: @customer.place_birth,
          marital_status_id: @customer.marital_status_id,
          member: @customer.member,
          nacionality_id: @customer.nacionality_id,
          name: @customer.name,
          occupation_id: @customer.occupation_id,
          phone: @customer.phone,
          work_address: @customer.work_address,
          card_id: @customer.card_id,
          monthly_income: 10000
        }
      }
    end

    assert_redirected_to customer_url(Customer.unscoped.last)
  end

  test 'should show customer' do
    get customer_url(@customer)
    assert_response :success
  end

  test 'should get edit' do
    get edit_customer_url(@customer)
    assert_response :success
  end

  test 'should update customer' do
    patch customer_url(@customer), params: { customer: { address: 'Address updated' } }
    assert_redirected_to customer_url(@customer)
  end
end

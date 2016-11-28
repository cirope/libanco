require 'test_helper'

class SuppliersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @supplier = suppliers :default

    login
  end

  test 'should get index' do
    get suppliers_url
    assert_response :success
  end

  test 'should get new' do
    get new_supplier_url
    assert_response :success
  end

  test 'should create supplier' do
    assert_difference('Supplier.count') do
      post suppliers_url, params: {
        supplier: {
          legal_name: 'New Supplier',
          tax_id: '12-12345678-2'
        }
      }
    end

    assert_redirected_to suppliers_url
  end

  test 'should get edit' do
    get edit_supplier_url(@supplier)
    assert_response :success
  end

  test 'should update supplier' do
    patch supplier_url(@supplier), params: { supplier: { legal_name: 'Supplier Updated' } }
    assert_redirected_to suppliers_url
  end
end

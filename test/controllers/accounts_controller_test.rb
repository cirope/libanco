require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts :default

    login
  end

  test 'should get index' do
    get accounts_url(subdomain: 'www')
    assert_response :success
  end

  test 'should get new' do
    get new_account_url(subdomain: 'www')
    assert_response :success
  end

  test 'should create account' do
    assert_difference('Account.count') do
      post accounts_url(subdomain: 'www'), params: {
        account: { name: 'New Account', subdomain: 'newaccount' }
      }
    end

    assert_redirected_to accounts_url
  end

  test 'should get edit' do
    get edit_account_url(@account, subdomain: 'www')
    assert_response :success
  end

  test 'should update account' do
    patch account_url(@account, subdomain: 'www'), params: { account: { name: 'Name updated' } }
    assert_redirected_to accounts_url
  end
end

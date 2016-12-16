require 'test_helper'

class BankAccounts::SearchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
  end

  test 'should get index' do
    get bank_accounts_searches_url, xhr: true, as: :json
    assert_response :success
  end
end

require 'test_helper'

class BanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bank = banks :default

    login
  end

  test 'should get index' do
    get banks_url
    assert_response :success
  end

  test 'should get new' do
    get new_bank_url
    assert_response :success
  end

  test 'should create bank' do
    assert_difference('Bank.count') do
      post banks_url, params: {
        bank: {
          name: 'New Bank',
          bank_accounts_attributes: [
            account: '123456',
            cbu: '2222222222222222222222'
          ]
        }
      }
    end

    assert_redirected_to banks_url
  end

  test 'should get shoe' do
    get bank_url(@bank)
    assert_response :success
  end

  test 'should get edit' do
    get edit_bank_url(@bank)
    assert_response :success
  end

  test 'should update bank' do
    patch bank_url(@bank), params: { bank: { name: 'Bank Updated' } }
    assert_redirected_to banks_url
  end
end

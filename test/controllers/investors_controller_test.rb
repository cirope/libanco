require 'test_helper'

class InvestorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @investor = investors :default

    login
  end

  test 'should get index' do
    get investors_url
    assert_response :success
  end

  test 'should get new' do
    get new_investor_url
    assert_response :success
  end

  test 'should create investor' do
    assert_difference 'Investor.count' do
      post investors_url, params: {
        investor: {
          address: @investor.address,
          cellphone: @investor.cellphone,
          city_id: @investor.city_id,
          state_id: @investor.state_id,
          consultant_id: @investor.consultant_id,
          identification: '27789678',
          identification_type: @investor.identification_type,
          investment_group_id: @investor.investment_group_id,
          lastname: @investor.lastname,
          name: @investor.name,
          phone: @investor.phone
        }
      }
    end

    assert_redirected_to investor_url(Investor.unscoped.last)
  end

  test 'should show investor' do
    get investor_url(@investor)
    assert_response :success
  end

  test 'should get edit' do
    get edit_investor_url(@investor)
    assert_response :success
  end

  test 'should update investor' do
    patch investor_url(@investor), params: { investor: { identification: '27876765' } }
    assert_redirected_to investor_url(@investor)
  end

  test 'should destroy investor' do
    assert_difference 'Investor.count', -1 do
      delete investor_url(@investor)
    end

    assert_redirected_to investors_url
  end
end

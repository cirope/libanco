require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards :default

    login
  end

  test 'should get index' do
    get cards_url
    assert_response :success
  end

  test 'should get new' do
    get new_card_url
    assert_response :success
  end

  test 'should create card' do
    assert_difference('Card.count') do
      post cards_url, params: {
        card: {
          name: 'New card',
          admission_fee: @card.admission_fee,
          monthly_fee: @card.monthly_fee
        }
      }
    end

    assert_redirected_to cards_url
  end

  test 'should get edit' do
    get edit_card_url(@card)
    assert_response :success
  end

  test 'should update card' do
    patch card_url(@card), params: { card: { name: 'Card updated' } }
    assert_redirected_to cards_url
  end
end

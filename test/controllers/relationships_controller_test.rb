require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @relationship = relationships :default

    login
  end

  test 'should get index' do
    get relationships_url
    assert_response :success
  end

  test 'should get new' do
    get new_relationship_url
    assert_response :success
  end

  test 'should create relationship' do
    assert_difference('Relationship.count') do
      post relationships_url, params: { relationship: { name: 'New name' } }
    end

    assert_redirected_to relationships_url
  end

  test 'should get edit' do
    get edit_relationship_url(@relationship)
    assert_response :success
  end

  test 'should update relationship' do
    patch relationship_url(@relationship), params: { relationship: { name: 'Name updated' } }
    assert_redirected_to relationships_url
  end
end

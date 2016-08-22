require 'test_helper'

class WorkgroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workgroup = workgroups :default

    login
  end

  test 'should get index' do
    get workgroups_url
    assert_response :success
  end

  test 'should get new' do
    get new_workgroup_url
    assert_response :success
  end

  test 'should create workgroup' do
    assert_difference('Workgroup.count') do
      post workgroups_url, params: { workgroup: { name: 'New name' } }
    end

    assert_redirected_to workgroups_url
  end

  test 'should get edit' do
    get edit_workgroup_url(@workgroup)
    assert_response :success
  end

  test 'should update workgroup' do
    patch workgroup_url(@workgroup), params: { workgroup: { name: 'Name updated' } }
    assert_redirected_to workgroups_url
  end
end

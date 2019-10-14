require 'test_helper'

class ResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resource = create(:resource) 
  end

  test "should get index" do
    get resources_url
    assert_response :success
  end
  
  test "should have no results on search" do
    get resources_url(:name => "HTML")
    assert_response :success
    assert_select ".card", 0
  end
  
  test "should have 1 result on search" do
    get resources_url(:name => "tutorial")
    assert_response :success
    assert_select ".card", 1
    assert_select ".card .header", "My tutorial" 
  end

  test "should get new" do
    get new_resource_url
    assert_response :success
  end

  test "should create resource" do
    assert_difference('Resource.count') do
      post resources_url, params: { resource: @resource.attributes } 
    end

    assert_redirected_to resources_url
  end

  test "should show resource" do
    get resource_url(@resource)
    assert_response :success
  end

  test "should not be editable" do
    get edit_resource_url(@resource)
    assert_response :unauthorized
  end

  test "should not update resource" do
    patch resource_url(@resource), params: { resource: { name: "Resource 1" } }
    assert_response :unauthorized
  end

  test "should not destroy resource" do
    delete resource_url(@resource)
    assert_response :unauthorized  
  end
end

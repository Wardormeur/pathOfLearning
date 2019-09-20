require 'test_helper'

class ResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resource = create(:resource) 
  end

  test "should get index" do
    get resources_url
    assert_response :success
  end
  
  test "should search for a specific resource" do
    get resources_url(:name => "HTML")
    assert_response :success
    assert_select "a", 1
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

  test "should get edit" do
    get edit_resource_url(@resource)
    assert_response :success
  end

  test "should update resource" do
    patch resource_url(@resource), params: { resource: { name: "Resource 1" } }
    assert_redirected_to resources_url
  end

  test "should destroy resource" do
    assert_difference('Resource.count', -1) do
      delete resource_url(@resource)
    end

    assert_redirected_to resources_url
  end
end

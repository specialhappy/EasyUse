require 'test_helper'

class Manager::RegionCentersControllerTest < ActionController::TestCase
  setup do
    @manager_region_center = manager_region_centers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manager_region_centers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manager_region_center" do
    assert_difference('Manager::RegionCenter.count') do
      post :create, manager_region_center: { description: @manager_region_center.description, name: @manager_region_center.name, url: @manager_region_center.url }
    end

    assert_redirected_to manager_region_center_path(assigns(:manager_region_center))
  end

  test "should show manager_region_center" do
    get :show, id: @manager_region_center
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manager_region_center
    assert_response :success
  end

  test "should update manager_region_center" do
    patch :update, id: @manager_region_center, manager_region_center: { description: @manager_region_center.description, name: @manager_region_center.name, url: @manager_region_center.url }
    assert_redirected_to manager_region_center_path(assigns(:manager_region_center))
  end

  test "should destroy manager_region_center" do
    assert_difference('Manager::RegionCenter.count', -1) do
      delete :destroy, id: @manager_region_center
    end

    assert_redirected_to manager_region_centers_path
  end
end

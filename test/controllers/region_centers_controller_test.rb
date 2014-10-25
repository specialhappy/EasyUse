require 'test_helper'

class RegionCentersControllerTest < ActionController::TestCase
  setup do
    @region_center = region_centers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:region_centers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create region_center" do
    assert_difference('RegionCenter.count') do
      post :create, region_center: {  }
    end

    assert_redirected_to region_center_path(assigns(:region_center))
  end

  test "should show region_center" do
    get :show, id: @region_center
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @region_center
    assert_response :success
  end

  test "should update region_center" do
    patch :update, id: @region_center, region_center: {  }
    assert_redirected_to region_center_path(assigns(:region_center))
  end

  test "should destroy region_center" do
    assert_difference('RegionCenter.count', -1) do
      delete :destroy, id: @region_center
    end

    assert_redirected_to region_centers_path
  end
end

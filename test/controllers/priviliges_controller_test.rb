require 'test_helper'

class PriviligesControllerTest < ActionController::TestCase
  setup do
    @privilige = priviliges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:priviliges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create privilige" do
    assert_difference('Privilige.count') do
      post :create, privilige: {  }
    end

    assert_redirected_to privilige_path(assigns(:privilige))
  end

  test "should show privilige" do
    get :show, id: @privilige
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @privilige
    assert_response :success
  end

  test "should update privilige" do
    patch :update, id: @privilige, privilige: {  }
    assert_redirected_to privilige_path(assigns(:privilige))
  end

  test "should destroy privilige" do
    assert_difference('Privilige.count', -1) do
      delete :destroy, id: @privilige
    end

    assert_redirected_to priviliges_path
  end
end

require 'test_helper'

class OperationLogsControllerTest < ActionController::TestCase
  setup do
    @operation_log = operation_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:operation_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create operation_log" do
    assert_difference('OperationLog.count') do
      post :create, operation_log: {  }
    end

    assert_redirected_to operation_log_path(assigns(:operation_log))
  end

  test "should show operation_log" do
    get :show, id: @operation_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @operation_log
    assert_response :success
  end

  test "should update operation_log" do
    patch :update, id: @operation_log, operation_log: {  }
    assert_redirected_to operation_log_path(assigns(:operation_log))
  end

  test "should destroy operation_log" do
    assert_difference('OperationLog.count', -1) do
      delete :destroy, id: @operation_log
    end

    assert_redirected_to operation_logs_path
  end
end

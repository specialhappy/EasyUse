require 'test_helper'

class WorkingRecordsControllerTest < ActionController::TestCase
  setup do
    @working_record = working_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:working_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create working_record" do
    assert_difference('WorkingRecord.count') do
      post :create, working_record: {  }
    end

    assert_redirected_to working_record_path(assigns(:working_record))
  end

  test "should show working_record" do
    get :show, id: @working_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @working_record
    assert_response :success
  end

  test "should update working_record" do
    patch :update, id: @working_record, working_record: {  }
    assert_redirected_to working_record_path(assigns(:working_record))
  end

  test "should destroy working_record" do
    assert_difference('WorkingRecord.count', -1) do
      delete :destroy, id: @working_record
    end

    assert_redirected_to working_records_path
  end
end

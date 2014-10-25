require 'test_helper'

class ApplicationFormsControllerTest < ActionController::TestCase
  setup do
    @application_form = application_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:application_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create application_form" do
    assert_difference('ApplicationForm.count') do
      post :create, application_form: {  }
    end

    assert_redirected_to application_form_path(assigns(:application_form))
  end

  test "should show application_form" do
    get :show, id: @application_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @application_form
    assert_response :success
  end

  test "should update application_form" do
    patch :update, id: @application_form, application_form: {  }
    assert_redirected_to application_form_path(assigns(:application_form))
  end

  test "should destroy application_form" do
    assert_difference('ApplicationForm.count', -1) do
      delete :destroy, id: @application_form
    end

    assert_redirected_to application_forms_path
  end
end

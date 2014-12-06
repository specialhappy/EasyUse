require 'test_helper'

class Manager::InstitutionsControllerTest < ActionController::TestCase
  setup do
    @manager_institution = manager_institutions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manager_institutions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manager_institution" do
    assert_difference('Manager::Institution.count') do
      post :create, manager_institution: { description: @manager_institution.description, name: @manager_institution.name, region_center_id: @manager_institution.region_center_id, url: @manager_institution.url }
    end

    assert_redirected_to manager_institution_path(assigns(:manager_institution))
  end

  test "should show manager_institution" do
    get :show, id: @manager_institution
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manager_institution
    assert_response :success
  end

  test "should update manager_institution" do
    patch :update, id: @manager_institution, manager_institution: { description: @manager_institution.description, name: @manager_institution.name, region_center_id: @manager_institution.region_center_id, url: @manager_institution.url }
    assert_redirected_to manager_institution_path(assigns(:manager_institution))
  end

  test "should destroy manager_institution" do
    assert_difference('Manager::Institution.count', -1) do
      delete :destroy, id: @manager_institution
    end

    assert_redirected_to manager_institutions_path
  end
end

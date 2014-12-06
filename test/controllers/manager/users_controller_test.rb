require 'test_helper'

class Manager::UsersControllerTest < ActionController::TestCase
  setup do
    @manager_user = manager_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manager_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manager_user" do
    assert_difference('Manager::User.count') do
      post :create, manager_user: { address: @manager_user.address, card_number: @manager_user.card_number, default_group_id: @manager_user.default_group_id, email: @manager_user.email, id_number: @manager_user.id_number, institution: @manager_user.institution, name: @manager_user.name, password: @manager_user.password, phone: @manager_user.phone, picture: @manager_user.picture, sex: @manager_user.sex, status: @manager_user.status }
    end

    assert_redirected_to manager_user_path(assigns(:manager_user))
  end

  test "should show manager_user" do
    get :show, id: @manager_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manager_user
    assert_response :success
  end

  test "should update manager_user" do
    patch :update, id: @manager_user, manager_user: { address: @manager_user.address, card_number: @manager_user.card_number, default_group_id: @manager_user.default_group_id, email: @manager_user.email, id_number: @manager_user.id_number, institution: @manager_user.institution, name: @manager_user.name, password: @manager_user.password, phone: @manager_user.phone, picture: @manager_user.picture, sex: @manager_user.sex, status: @manager_user.status }
    assert_redirected_to manager_user_path(assigns(:manager_user))
  end

  test "should destroy manager_user" do
    assert_difference('Manager::User.count', -1) do
      delete :destroy, id: @manager_user
    end

    assert_redirected_to manager_users_path
  end
end

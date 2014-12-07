require 'test_helper'

class Manager::CheckRulesControllerTest < ActionController::TestCase
  setup do
    @manager_check_rule = manager_check_rules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manager_check_rules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manager_check_rule" do
    assert_difference('Manager::CheckRule.count') do
      post :create, manager_check_rule: { applid: @manager_check_rule.applid, description: @manager_check_rule.description, name: @manager_check_rule.name }
    end

    assert_redirected_to manager_check_rule_path(assigns(:manager_check_rule))
  end

  test "should show manager_check_rule" do
    get :show, id: @manager_check_rule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manager_check_rule
    assert_response :success
  end

  test "should update manager_check_rule" do
    patch :update, id: @manager_check_rule, manager_check_rule: { applid: @manager_check_rule.applid, description: @manager_check_rule.description, name: @manager_check_rule.name }
    assert_redirected_to manager_check_rule_path(assigns(:manager_check_rule))
  end

  test "should destroy manager_check_rule" do
    assert_difference('Manager::CheckRule.count', -1) do
      delete :destroy, id: @manager_check_rule
    end

    assert_redirected_to manager_check_rules_path
  end
end

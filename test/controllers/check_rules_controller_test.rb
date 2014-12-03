require 'test_helper'

class CheckRulesControllerTest < ActionController::TestCase
  setup do
    @check_rule = check_rules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:check_rules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create check_rule" do
    assert_difference('CheckRule.count') do
      post :create, check_rule: { description: @check_rule.description, name: @check_rule.name }
    end

    assert_redirected_to check_rule_path(assigns(:check_rule))
  end

  test "should show check_rule" do
    get :show, id: @check_rule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @check_rule
    assert_response :success
  end

  test "should update check_rule" do
    patch :update, id: @check_rule, check_rule: { description: @check_rule.description, name: @check_rule.name }
    assert_redirected_to check_rule_path(assigns(:check_rule))
  end

  test "should destroy check_rule" do
    assert_difference('CheckRule.count', -1) do
      delete :destroy, id: @check_rule
    end

    assert_redirected_to check_rules_path
  end
end

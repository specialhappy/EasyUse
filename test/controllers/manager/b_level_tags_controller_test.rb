require 'test_helper'

class Manager::BLevelTagsControllerTest < ActionController::TestCase
  setup do
    @manager_b_level_tag = manager_b_level_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manager_b_level_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manager_b_level_tag" do
    assert_difference('Manager::BLevelTag.count') do
      post :create, manager_b_level_tag: { a_level_tag_id: @manager_b_level_tag.a_level_tag_id, description: @manager_b_level_tag.description, name: @manager_b_level_tag.name }
    end

    assert_redirected_to manager_b_level_tag_path(assigns(:manager_b_level_tag))
  end

  test "should show manager_b_level_tag" do
    get :show, id: @manager_b_level_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manager_b_level_tag
    assert_response :success
  end

  test "should update manager_b_level_tag" do
    patch :update, id: @manager_b_level_tag, manager_b_level_tag: { a_level_tag_id: @manager_b_level_tag.a_level_tag_id, description: @manager_b_level_tag.description, name: @manager_b_level_tag.name }
    assert_redirected_to manager_b_level_tag_path(assigns(:manager_b_level_tag))
  end

  test "should destroy manager_b_level_tag" do
    assert_difference('Manager::BLevelTag.count', -1) do
      delete :destroy, id: @manager_b_level_tag
    end

    assert_redirected_to manager_b_level_tags_path
  end
end

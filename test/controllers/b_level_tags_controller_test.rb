require 'test_helper'

class BLevelTagsControllerTest < ActionController::TestCase
  setup do
    @b_level_tag = b_level_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:b_level_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create b_level_tag" do
    assert_difference('BLevelTag.count') do
      post :create, b_level_tag: {  }
    end

    assert_redirected_to b_level_tag_path(assigns(:b_level_tag))
  end

  test "should show b_level_tag" do
    get :show, id: @b_level_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @b_level_tag
    assert_response :success
  end

  test "should update b_level_tag" do
    patch :update, id: @b_level_tag, b_level_tag: {  }
    assert_redirected_to b_level_tag_path(assigns(:b_level_tag))
  end

  test "should destroy b_level_tag" do
    assert_difference('BLevelTag.count', -1) do
      delete :destroy, id: @b_level_tag
    end

    assert_redirected_to b_level_tags_path
  end
end

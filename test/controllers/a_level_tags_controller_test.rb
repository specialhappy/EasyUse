require 'test_helper'

class ALevelTagsControllerTest < ActionController::TestCase
  setup do
    @a_level_tag = a_level_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:a_level_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create a_level_tag" do
    assert_difference('ALevelTag.count') do
      post :create, a_level_tag: {  }
    end

    assert_redirected_to a_level_tag_path(assigns(:a_level_tag))
  end

  test "should show a_level_tag" do
    get :show, id: @a_level_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @a_level_tag
    assert_response :success
  end

  test "should update a_level_tag" do
    patch :update, id: @a_level_tag, a_level_tag: {  }
    assert_redirected_to a_level_tag_path(assigns(:a_level_tag))
  end

  test "should destroy a_level_tag" do
    assert_difference('ALevelTag.count', -1) do
      delete :destroy, id: @a_level_tag
    end

    assert_redirected_to a_level_tags_path
  end
end

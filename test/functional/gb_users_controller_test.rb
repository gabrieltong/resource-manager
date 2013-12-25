require 'test_helper'

class GbUsersControllerTest < ActionController::TestCase
  setup do
    @gb_user = gb_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gb_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gb_user" do
    assert_difference('GbUser.count') do
      post :create, gb_user: { username: @gb_user.username }
    end

    assert_redirected_to gb_user_path(assigns(:gb_user))
  end

  test "should show gb_user" do
    get :show, id: @gb_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gb_user
    assert_response :success
  end

  test "should update gb_user" do
    put :update, id: @gb_user, gb_user: { username: @gb_user.username }
    assert_redirected_to gb_user_path(assigns(:gb_user))
  end

  test "should destroy gb_user" do
    assert_difference('GbUser.count', -1) do
      delete :destroy, id: @gb_user
    end

    assert_redirected_to gb_users_path
  end
end

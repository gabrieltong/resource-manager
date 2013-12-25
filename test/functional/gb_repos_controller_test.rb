require 'test_helper'

class GbReposControllerTest < ActionController::TestCase
  setup do
    @gb_repo = gb_repos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gb_repos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gb_repo" do
    assert_difference('GbRepo.count') do
      post :create, gb_repo: { address: @gb_repo.address }
    end

    assert_redirected_to gb_repo_path(assigns(:gb_repo))
  end

  test "should show gb_repo" do
    get :show, id: @gb_repo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gb_repo
    assert_response :success
  end

  test "should update gb_repo" do
    put :update, id: @gb_repo, gb_repo: { address: @gb_repo.address }
    assert_redirected_to gb_repo_path(assigns(:gb_repo))
  end

  test "should destroy gb_repo" do
    assert_difference('GbRepo.count', -1) do
      delete :destroy, id: @gb_repo
    end

    assert_redirected_to gb_repos_path
  end
end

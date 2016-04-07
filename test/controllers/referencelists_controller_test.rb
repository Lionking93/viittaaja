require 'test_helper'

class ReferencelistsControllerTest < ActionController::TestCase
  setup do
    @referencelist = referencelists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:referencelists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create referencelist" do
    assert_difference('Referencelist.count') do
      post :create, referencelist: { name: @referencelist.name, user_id: @referencelist.user_id }
    end

    assert_redirected_to referencelist_path(assigns(:referencelist))
  end

  test "should show referencelist" do
    get :show, id: @referencelist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @referencelist
    assert_response :success
  end

  test "should update referencelist" do
    patch :update, id: @referencelist, referencelist: { name: @referencelist.name, user_id: @referencelist.user_id }
    assert_redirected_to referencelist_path(assigns(:referencelist))
  end

  test "should destroy referencelist" do
    assert_difference('Referencelist.count', -1) do
      delete :destroy, id: @referencelist
    end

    assert_redirected_to referencelists_path
  end
end

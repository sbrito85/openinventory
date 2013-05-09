require 'test_helper'

class ServerracksControllerTest < ActionController::TestCase
  setup do
    @serverrack = serverracks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:serverracks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create serverrack" do
    assert_difference('Serverrack.count') do
      post :create, serverrack: { name: @serverrack.name, serverroom_id: @serverrack.serverroom_id, totalunits: @serverrack.totalunits }
    end

    assert_redirected_to serverrack_path(assigns(:serverrack))
  end

  test "should show serverrack" do
    get :show, id: @serverrack
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @serverrack
    assert_response :success
  end

  test "should update serverrack" do
    put :update, id: @serverrack, serverrack: { name: @serverrack.name, serverroom_id: @serverrack.serverroom_id, totalunits: @serverrack.totalunits }
    assert_redirected_to serverrack_path(assigns(:serverrack))
  end

  test "should destroy serverrack" do
    assert_difference('Serverrack.count', -1) do
      delete :destroy, id: @serverrack
    end

    assert_redirected_to serverracks_path
  end
end

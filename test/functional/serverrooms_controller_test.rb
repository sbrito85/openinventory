require 'test_helper'

class ServerroomsControllerTest < ActionController::TestCase
  setup do
    @serverroom = serverrooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:serverrooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create serverroom" do
    assert_difference('Serverroom.count') do
      post :create, serverroom: { name: @serverroom.name, office_id: @serverroom.office_id }
    end

    assert_redirected_to serverroom_path(assigns(:serverroom))
  end

  test "should show serverroom" do
    get :show, id: @serverroom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @serverroom
    assert_response :success
  end

  test "should update serverroom" do
    put :update, id: @serverroom, serverroom: { name: @serverroom.name, office_id: @serverroom.office_id }
    assert_redirected_to serverroom_path(assigns(:serverroom))
  end

  test "should destroy serverroom" do
    assert_difference('Serverroom.count', -1) do
      delete :destroy, id: @serverroom
    end

    assert_redirected_to serverrooms_path
  end
end

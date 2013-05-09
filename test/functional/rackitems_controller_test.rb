require 'test_helper'

class RackitemsControllerTest < ActionController::TestCase
  setup do
    @rackitem = rackitems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rackitems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rackitem" do
    assert_difference('Rackitem.count') do
      post :create, rackitem: { asset_id: @rackitem.asset_id, comments: @rackitem.comments, ipaddress: @rackitem.ipaddress, positition: @rackitem.positition, rack_id: @rackitem.rack_id, unitsize: @rackitem.unitsize }
    end

    assert_redirected_to rackitem_path(assigns(:rackitem))
  end

  test "should show rackitem" do
    get :show, id: @rackitem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rackitem
    assert_response :success
  end

  test "should update rackitem" do
    put :update, id: @rackitem, rackitem: { asset_id: @rackitem.asset_id, comments: @rackitem.comments, ipaddress: @rackitem.ipaddress, positition: @rackitem.positition, rack_id: @rackitem.rack_id, unitsize: @rackitem.unitsize }
    assert_redirected_to rackitem_path(assigns(:rackitem))
  end

  test "should destroy rackitem" do
    assert_difference('Rackitem.count', -1) do
      delete :destroy, id: @rackitem
    end

    assert_redirected_to rackitems_path
  end
end

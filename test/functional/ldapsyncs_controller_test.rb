require 'test_helper'

class LdapsyncsControllerTest < ActionController::TestCase
  setup do
    @ldapsync = ldapsyncs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ldapsyncs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ldapsync" do
    assert_difference('Ldapsync.count') do
      post :create, ldapsync: {  }
    end

    assert_redirected_to ldapsync_path(assigns(:ldapsync))
  end

  test "should show ldapsync" do
    get :show, id: @ldapsync
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ldapsync
    assert_response :success
  end

  test "should update ldapsync" do
    put :update, id: @ldapsync, ldapsync: {  }
    assert_redirected_to ldapsync_path(assigns(:ldapsync))
  end

  test "should destroy ldapsync" do
    assert_difference('Ldapsync.count', -1) do
      delete :destroy, id: @ldapsync
    end

    assert_redirected_to ldapsyncs_path
  end
end

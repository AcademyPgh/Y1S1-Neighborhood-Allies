require 'test_helper'

class OrgadminsControllerTest < ActionController::TestCase
  setup do
    @orgadmin = orgadmins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orgadmins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orgadmin" do
    assert_difference('Orgadmin.count') do
      post :create, orgadmin: {  }
    end

    assert_redirected_to orgadmin_path(assigns(:orgadmin))
  end

  test "should show orgadmin" do
    get :show, id: @orgadmin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orgadmin
    assert_response :success
  end

  test "should update orgadmin" do
    patch :update, id: @orgadmin, orgadmin: {  }
    assert_redirected_to orgadmin_path(assigns(:orgadmin))
  end

  test "should destroy orgadmin" do
    assert_difference('Orgadmin.count', -1) do
      delete :destroy, id: @orgadmin
    end

    assert_redirected_to orgadmins_path
  end
end

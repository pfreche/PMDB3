require 'test_helper'

class AgroupsControllerTest < ActionController::TestCase
  setup do
    @agroup = agroups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:agroups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create agroup" do
    assert_difference('Agroup.count') do
      post :create, agroup: @agroup.attributes
    end

    assert_redirected_to agroup_path(assigns(:agroup))
  end

  test "should show agroup" do
    get :show, id: @agroup.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @agroup.to_param
    assert_response :success
  end

  test "should update agroup" do
    put :update, id: @agroup.to_param, agroup: @agroup.attributes
    assert_redirected_to agroup_path(assigns(:agroup))
  end

  test "should destroy agroup" do
    assert_difference('Agroup.count', -1) do
      delete :destroy, id: @agroup.to_param
    end

    assert_redirected_to agroups_path
  end
end

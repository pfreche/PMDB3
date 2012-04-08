require 'test_helper'

class FollersControllerTest < ActionController::TestCase
  setup do
    @foller = follers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:follers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create foller" do
    assert_difference('Foller.count') do
      post :create, foller: @foller.attributes
    end

    assert_redirected_to foller_path(assigns(:foller))
  end

  test "should show foller" do
    get :show, id: @foller.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @foller.to_param
    assert_response :success
  end

  test "should update foller" do
    put :update, id: @foller.to_param, foller: @foller.attributes
    assert_redirected_to foller_path(assigns(:foller))
  end

  test "should destroy foller" do
    assert_difference('Foller.count', -1) do
      delete :destroy, id: @foller.to_param
    end

    assert_redirected_to follers_path
  end
end

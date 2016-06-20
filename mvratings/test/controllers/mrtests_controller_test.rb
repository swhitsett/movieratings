require 'test_helper'

class MrtestsControllerTest < ActionController::TestCase
  setup do
    @mrtest = mrtests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mrtests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mrtest" do
    assert_difference('Mrtest.count') do
      post :create, mrtest: { first: @mrtest.first }
    end

    assert_redirected_to mrtest_path(assigns(:mrtest))
  end

  test "should show mrtest" do
    get :show, id: @mrtest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mrtest
    assert_response :success
  end

  test "should update mrtest" do
    patch :update, id: @mrtest, mrtest: { first: @mrtest.first }
    assert_redirected_to mrtest_path(assigns(:mrtest))
  end

  test "should destroy mrtest" do
    assert_difference('Mrtest.count', -1) do
      delete :destroy, id: @mrtest
    end

    assert_redirected_to mrtests_path
  end
end

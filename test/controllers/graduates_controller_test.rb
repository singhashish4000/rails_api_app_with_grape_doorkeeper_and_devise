require 'test_helper'

class GraduatesControllerTest < ActionController::TestCase
  setup do
    @graduate = graduates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:graduates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create graduate" do
    assert_difference('Graduate.count') do
      post :create, graduate: { name: @graduate.name }
    end

    assert_redirected_to graduate_path(assigns(:graduate))
  end

  test "should show graduate" do
    get :show, id: @graduate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @graduate
    assert_response :success
  end

  test "should update graduate" do
    patch :update, id: @graduate, graduate: { name: @graduate.name }
    assert_redirected_to graduate_path(assigns(:graduate))
  end

  test "should destroy graduate" do
    assert_difference('Graduate.count', -1) do
      delete :destroy, id: @graduate
    end

    assert_redirected_to graduates_path
  end
end

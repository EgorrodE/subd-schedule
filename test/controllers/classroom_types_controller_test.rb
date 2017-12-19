require 'test_helper'

class ClassroomTypesControllerTest < ActionController::TestCase
  setup do
    @classroom_type = classroom_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:classroom_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create classroom_type" do
    assert_difference('ClassroomType.count') do
      post :create, classroom_type: {  }
    end

    assert_redirected_to classroom_type_path(assigns(:classroom_type))
  end

  test "should show classroom_type" do
    get :show, id: @classroom_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @classroom_type
    assert_response :success
  end

  test "should update classroom_type" do
    patch :update, id: @classroom_type, classroom_type: {  }
    assert_redirected_to classroom_type_path(assigns(:classroom_type))
  end

  test "should destroy classroom_type" do
    assert_difference('ClassroomType.count', -1) do
      delete :destroy, id: @classroom_type
    end

    assert_redirected_to classroom_types_path
  end
end

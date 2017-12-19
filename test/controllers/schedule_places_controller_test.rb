require 'test_helper'

class SchedulePlacesControllerTest < ActionController::TestCase
  setup do
    @schedule_place = schedule_places(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_places)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_place" do
    assert_difference('SchedulePlace.count') do
      post :create, schedule_place: {  }
    end

    assert_redirected_to schedule_place_path(assigns(:schedule_place))
  end

  test "should show schedule_place" do
    get :show, id: @schedule_place
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_place
    assert_response :success
  end

  test "should update schedule_place" do
    patch :update, id: @schedule_place, schedule_place: {  }
    assert_redirected_to schedule_place_path(assigns(:schedule_place))
  end

  test "should destroy schedule_place" do
    assert_difference('SchedulePlace.count', -1) do
      delete :destroy, id: @schedule_place
    end

    assert_redirected_to schedule_places_path
  end
end

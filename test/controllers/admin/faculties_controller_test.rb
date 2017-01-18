require 'test_helper'

class Admin::FacultiesControllerTest < ActionController::TestCase
  setup do
    @admin_faculty = admin_faculties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_faculties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_faculty" do
    assert_difference('Admin::Faculty.count') do
      post :create, admin_faculty: {  }
    end

    assert_redirected_to admin_faculty_path(assigns(:admin_faculty))
  end

  test "should show admin_faculty" do
    get :show, id: @admin_faculty
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_faculty
    assert_response :success
  end

  test "should update admin_faculty" do
    patch :update, id: @admin_faculty, admin_faculty: {  }
    assert_redirected_to admin_faculty_path(assigns(:admin_faculty))
  end

  test "should destroy admin_faculty" do
    assert_difference('Admin::Faculty.count', -1) do
      delete :destroy, id: @admin_faculty
    end

    assert_redirected_to admin_faculties_path
  end
end

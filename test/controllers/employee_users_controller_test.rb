require "test_helper"

class EmployeeUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_user = employee_users(:one)
  end

  test "should get index" do
    get employee_users_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_user_url
    assert_response :success
  end

  test "should create employee_user" do
    assert_difference("EmployeeUser.count") do
      post employee_users_url, params: { employee_user: { password: @employee_user.password, username: @employee_user.username } }
    end

    assert_redirected_to employee_user_url(EmployeeUser.last)
  end

  test "should show employee_user" do
    get employee_user_url(@employee_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_user_url(@employee_user)
    assert_response :success
  end

  test "should update employee_user" do
    patch employee_user_url(@employee_user), params: { employee_user: { password: @employee_user.password, username: @employee_user.username } }
    assert_redirected_to employee_user_url(@employee_user)
  end

  test "should destroy employee_user" do
    assert_difference("EmployeeUser.count", -1) do
      delete employee_user_url(@employee_user)
    end

    assert_redirected_to employee_users_url
  end
end

require "test_helper"

class EmployeeProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_profile = employee_profiles(:one)
  end

  test "should get index" do
    get employee_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_profile_url
    assert_response :success
  end

  test "should create employee_profile" do
    assert_difference("EmployeeProfile.count") do
      post employee_profiles_url, params: { employee_profile: { age: @employee_profile.age, birthdate: @employee_profile.birthdate, department_id: @employee_profile.department_id, division_id: @employee_profile.division_id, employee_no: @employee_profile.employee_no, employee_user_id: @employee_profile.employee_user_id, first_name: @employee_profile.first_name, last_name: @employee_profile.last_name, middle_name: @employee_profile.middle_name, suffix: @employee_profile.suffix } }
    end

    assert_redirected_to employee_profile_url(EmployeeProfile.last)
  end

  test "should show employee_profile" do
    get employee_profile_url(@employee_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_profile_url(@employee_profile)
    assert_response :success
  end

  test "should update employee_profile" do
    patch employee_profile_url(@employee_profile), params: { employee_profile: { age: @employee_profile.age, birthdate: @employee_profile.birthdate, department_id: @employee_profile.department_id, division_id: @employee_profile.division_id, employee_no: @employee_profile.employee_no, employee_user_id: @employee_profile.employee_user_id, first_name: @employee_profile.first_name, last_name: @employee_profile.last_name, middle_name: @employee_profile.middle_name, suffix: @employee_profile.suffix } }
    assert_redirected_to employee_profile_url(@employee_profile)
  end

  test "should destroy employee_profile" do
    assert_difference("EmployeeProfile.count", -1) do
      delete employee_profile_url(@employee_profile)
    end

    assert_redirected_to employee_profiles_url
  end
end

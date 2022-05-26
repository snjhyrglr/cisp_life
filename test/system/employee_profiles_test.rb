require "application_system_test_case"

class EmployeeProfilesTest < ApplicationSystemTestCase
  setup do
    @employee_profile = employee_profiles(:one)
  end

  test "visiting the index" do
    visit employee_profiles_url
    assert_selector "h1", text: "Employee profiles"
  end

  test "should create employee profile" do
    visit employee_profiles_url
    click_on "New employee profile"

    fill_in "Age", with: @employee_profile.age
    fill_in "Birthdate", with: @employee_profile.birthdate
    fill_in "Department", with: @employee_profile.department_id
    fill_in "Division", with: @employee_profile.division_id
    fill_in "Employee no", with: @employee_profile.employee_no
    fill_in "Employee user", with: @employee_profile.employee_user_id
    fill_in "First name", with: @employee_profile.first_name
    fill_in "Last name", with: @employee_profile.last_name
    fill_in "Middle name", with: @employee_profile.middle_name
    fill_in "Suffix", with: @employee_profile.suffix
    click_on "Create Employee profile"

    assert_text "Employee profile was successfully created"
    click_on "Back"
  end

  test "should update Employee profile" do
    visit employee_profile_url(@employee_profile)
    click_on "Edit this employee profile", match: :first

    fill_in "Age", with: @employee_profile.age
    fill_in "Birthdate", with: @employee_profile.birthdate
    fill_in "Department", with: @employee_profile.department_id
    fill_in "Division", with: @employee_profile.division_id
    fill_in "Employee no", with: @employee_profile.employee_no
    fill_in "Employee user", with: @employee_profile.employee_user_id
    fill_in "First name", with: @employee_profile.first_name
    fill_in "Last name", with: @employee_profile.last_name
    fill_in "Middle name", with: @employee_profile.middle_name
    fill_in "Suffix", with: @employee_profile.suffix
    click_on "Update Employee profile"

    assert_text "Employee profile was successfully updated"
    click_on "Back"
  end

  test "should destroy Employee profile" do
    visit employee_profile_url(@employee_profile)
    click_on "Destroy this employee profile", match: :first

    assert_text "Employee profile was successfully destroyed"
  end
end

require "application_system_test_case"

class EmployeeUsersTest < ApplicationSystemTestCase
  setup do
    @employee_user = employee_users(:one)
  end

  test "visiting the index" do
    visit employee_users_url
    assert_selector "h1", text: "Employee users"
  end

  test "should create employee user" do
    visit employee_users_url
    click_on "New employee user"

    fill_in "Password", with: @employee_user.password
    fill_in "Username", with: @employee_user.username
    click_on "Create Employee user"

    assert_text "Employee user was successfully created"
    click_on "Back"
  end

  test "should update Employee user" do
    visit employee_user_url(@employee_user)
    click_on "Edit this employee user", match: :first

    fill_in "Password", with: @employee_user.password
    fill_in "Username", with: @employee_user.username
    click_on "Update Employee user"

    assert_text "Employee user was successfully updated"
    click_on "Back"
  end

  test "should destroy Employee user" do
    visit employee_user_url(@employee_user)
    click_on "Destroy this employee user", match: :first

    assert_text "Employee user was successfully destroyed"
  end
end

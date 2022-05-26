require "application_system_test_case"

class CooperativeBranchesTest < ApplicationSystemTestCase
  setup do
    @cooperative_branch = cooperative_branches(:one)
  end

  test "visiting the index" do
    visit cooperative_branches_url
    assert_selector "h1", text: "Cooperative branches"
  end

  test "should create cooperative branch" do
    visit cooperative_branches_url
    click_on "New cooperative branch"

    fill_in "Address", with: @cooperative_branch.address
    fill_in "Cooperative", with: @cooperative_branch.cooperative_id
    fill_in "Name", with: @cooperative_branch.name
    click_on "Create Cooperative branch"

    assert_text "Cooperative branch was successfully created"
    click_on "Back"
  end

  test "should update Cooperative branch" do
    visit cooperative_branch_url(@cooperative_branch)
    click_on "Edit this cooperative branch", match: :first

    fill_in "Address", with: @cooperative_branch.address
    fill_in "Cooperative", with: @cooperative_branch.cooperative_id
    fill_in "Name", with: @cooperative_branch.name
    click_on "Update Cooperative branch"

    assert_text "Cooperative branch was successfully updated"
    click_on "Back"
  end

  test "should destroy Cooperative branch" do
    visit cooperative_branch_url(@cooperative_branch)
    click_on "Destroy this cooperative branch", match: :first

    assert_text "Cooperative branch was successfully destroyed"
  end
end

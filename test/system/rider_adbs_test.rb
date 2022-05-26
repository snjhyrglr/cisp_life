require "application_system_test_case"

class RiderAdbsTest < ApplicationSystemTestCase
  setup do
    @rider_adb = rider_adbs(:one)
  end

  test "visiting the index" do
    visit rider_adbs_url
    assert_selector "h1", text: "Rider adbs"
  end

  test "should create rider adb" do
    visit rider_adbs_url
    click_on "New rider adb"

    fill_in "Rate", with: @rider_adb.rate
    click_on "Create Rider adb"

    assert_text "Rider adb was successfully created"
    click_on "Back"
  end

  test "should update Rider adb" do
    visit rider_adb_url(@rider_adb)
    click_on "Edit this rider adb", match: :first

    fill_in "Rate", with: @rider_adb.rate
    click_on "Update Rider adb"

    assert_text "Rider adb was successfully updated"
    click_on "Back"
  end

  test "should destroy Rider adb" do
    visit rider_adb_url(@rider_adb)
    click_on "Destroy this rider adb", match: :first

    assert_text "Rider adb was successfully destroyed"
  end
end

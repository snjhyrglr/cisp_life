require "application_system_test_case"

class RiderAddTpdsTest < ApplicationSystemTestCase
  setup do
    @rider_add_tpd = rider_add_tpds(:one)
  end

  test "visiting the index" do
    visit rider_add_tpds_url
    assert_selector "h1", text: "Rider add tpds"
  end

  test "should create rider add tpd" do
    visit rider_add_tpds_url
    click_on "New rider add tpd"

    fill_in "Rate", with: @rider_add_tpd.rate
    click_on "Create Rider add tpd"

    assert_text "Rider add tpd was successfully created"
    click_on "Back"
  end

  test "should update Rider add tpd" do
    visit rider_add_tpd_url(@rider_add_tpd)
    click_on "Edit this rider add tpd", match: :first

    fill_in "Rate", with: @rider_add_tpd.rate
    click_on "Update Rider add tpd"

    assert_text "Rider add tpd was successfully updated"
    click_on "Back"
  end

  test "should destroy Rider add tpd" do
    visit rider_add_tpd_url(@rider_add_tpd)
    click_on "Destroy this rider add tpd", match: :first

    assert_text "Rider add tpd was successfully destroyed"
  end
end

require "application_system_test_case"

class LppiRatesTest < ApplicationSystemTestCase
  setup do
    @lppi_rate = lppi_rates(:one)
  end

  test "visiting the index" do
    visit lppi_rates_url
    assert_selector "h1", text: "Lppi rates"
  end

  test "should create lppi rate" do
    visit lppi_rates_url
    click_on "New lppi rate"

    fill_in "Adb rate", with: @lppi_rate.adb_rate
    fill_in "Add tpd annual", with: @lppi_rate.add_tpd_annual_id
    fill_in "Add tpd rate", with: @lppi_rate.add_tpd_rate
    fill_in "Max age", with: @lppi_rate.max_age
    fill_in "Max allowed comm", with: @lppi_rate.max_allowed_comm
    fill_in "Max annual rate", with: @lppi_rate.max_annual_rate
    fill_in "Max coverage", with: @lppi_rate.max_coverage
    fill_in "Max monthly rate", with: @lppi_rate.max_monthly_rate
    fill_in "Min age", with: @lppi_rate.min_age
    fill_in "Min annual rate", with: @lppi_rate.min_annual_rate
    fill_in "Min coverage", with: @lppi_rate.min_coverage
    fill_in "Min monthly rate", with: @lppi_rate.min_monthly_rate
    fill_in "Rider adb", with: @lppi_rate.rider_adb_id
    fill_in "Rider add tpd", with: @lppi_rate.rider_add_tpd_id
    click_on "Create Lppi rate"

    assert_text "Lppi rate was successfully created"
    click_on "Back"
  end

  test "should update Lppi rate" do
    visit lppi_rate_url(@lppi_rate)
    click_on "Edit this lppi rate", match: :first

    fill_in "Adb rate", with: @lppi_rate.adb_rate
    fill_in "Add tpd annual", with: @lppi_rate.add_tpd_annual_id
    fill_in "Add tpd rate", with: @lppi_rate.add_tpd_rate
    fill_in "Max age", with: @lppi_rate.max_age
    fill_in "Max allowed comm", with: @lppi_rate.max_allowed_comm
    fill_in "Max annual rate", with: @lppi_rate.max_annual_rate
    fill_in "Max coverage", with: @lppi_rate.max_coverage
    fill_in "Max monthly rate", with: @lppi_rate.max_monthly_rate
    fill_in "Min age", with: @lppi_rate.min_age
    fill_in "Min annual rate", with: @lppi_rate.min_annual_rate
    fill_in "Min coverage", with: @lppi_rate.min_coverage
    fill_in "Min monthly rate", with: @lppi_rate.min_monthly_rate
    fill_in "Rider adb", with: @lppi_rate.rider_adb_id
    fill_in "Rider add tpd", with: @lppi_rate.rider_add_tpd_id
    click_on "Update Lppi rate"

    assert_text "Lppi rate was successfully updated"
    click_on "Back"
  end

  test "should destroy Lppi rate" do
    visit lppi_rate_url(@lppi_rate)
    click_on "Destroy this lppi rate", match: :first

    assert_text "Lppi rate was successfully destroyed"
  end
end

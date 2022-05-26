require "application_system_test_case"

class ActuarialMatrixLppisTest < ApplicationSystemTestCase
  setup do
    @actuarial_matrix_lppi = actuarial_matrix_lppis(:one)
  end

  test "visiting the index" do
    visit actuarial_matrix_lppis_url
    assert_selector "h1", text: "Actuarial matrix lppis"
  end

  test "should create actuarial matrix lppi" do
    visit actuarial_matrix_lppis_url
    click_on "New actuarial matrix lppi"

    fill_in "Max age", with: @actuarial_matrix_lppi.max_age
    fill_in "Max allowed comm", with: @actuarial_matrix_lppi.max_allowed_comm
    fill_in "Max annual prem rate", with: @actuarial_matrix_lppi.max_annual_prem_rate
    fill_in "Min age", with: @actuarial_matrix_lppi.min_age
    fill_in "Min annual prem rate", with: @actuarial_matrix_lppi.min_annual_prem_rate
    fill_in "Rider adb", with: @actuarial_matrix_lppi.rider_adb_id
    fill_in "Rider add tpd", with: @actuarial_matrix_lppi.rider_add_tpd_id
    click_on "Create Actuarial matrix lppi"

    assert_text "Actuarial matrix lppi was successfully created"
    click_on "Back"
  end

  test "should update Actuarial matrix lppi" do
    visit actuarial_matrix_lppi_url(@actuarial_matrix_lppi)
    click_on "Edit this actuarial matrix lppi", match: :first

    fill_in "Max age", with: @actuarial_matrix_lppi.max_age
    fill_in "Max allowed comm", with: @actuarial_matrix_lppi.max_allowed_comm
    fill_in "Max annual prem rate", with: @actuarial_matrix_lppi.max_annual_prem_rate
    fill_in "Min age", with: @actuarial_matrix_lppi.min_age
    fill_in "Min annual prem rate", with: @actuarial_matrix_lppi.min_annual_prem_rate
    fill_in "Rider adb", with: @actuarial_matrix_lppi.rider_adb_id
    fill_in "Rider add tpd", with: @actuarial_matrix_lppi.rider_add_tpd_id
    click_on "Update Actuarial matrix lppi"

    assert_text "Actuarial matrix lppi was successfully updated"
    click_on "Back"
  end

  test "should destroy Actuarial matrix lppi" do
    visit actuarial_matrix_lppi_url(@actuarial_matrix_lppi)
    click_on "Destroy this actuarial matrix lppi", match: :first

    assert_text "Actuarial matrix lppi was successfully destroyed"
  end
end

require "test_helper"

class LppiRatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lppi_rate = lppi_rates(:one)
  end

  test "should get index" do
    get lppi_rates_url
    assert_response :success
  end

  test "should get new" do
    get new_lppi_rate_url
    assert_response :success
  end

  test "should create lppi_rate" do
    assert_difference("LppiRate.count") do
      post lppi_rates_url, params: { lppi_rate: { adb_rate: @lppi_rate.adb_rate, add_tpd_annual_id: @lppi_rate.add_tpd_annual_id, add_tpd_rate: @lppi_rate.add_tpd_rate, max_age: @lppi_rate.max_age, max_allowed_comm: @lppi_rate.max_allowed_comm, max_annual_rate: @lppi_rate.max_annual_rate, max_coverage: @lppi_rate.max_coverage, max_monthly_rate: @lppi_rate.max_monthly_rate, min_age: @lppi_rate.min_age, min_annual_rate: @lppi_rate.min_annual_rate, min_coverage: @lppi_rate.min_coverage, min_monthly_rate: @lppi_rate.min_monthly_rate, rider_adb_id: @lppi_rate.rider_adb_id, rider_add_tpd_id: @lppi_rate.rider_add_tpd_id } }
    end

    assert_redirected_to lppi_rate_url(LppiRate.last)
  end

  test "should show lppi_rate" do
    get lppi_rate_url(@lppi_rate)
    assert_response :success
  end

  test "should get edit" do
    get edit_lppi_rate_url(@lppi_rate)
    assert_response :success
  end

  test "should update lppi_rate" do
    patch lppi_rate_url(@lppi_rate), params: { lppi_rate: { adb_rate: @lppi_rate.adb_rate, add_tpd_annual_id: @lppi_rate.add_tpd_annual_id, add_tpd_rate: @lppi_rate.add_tpd_rate, max_age: @lppi_rate.max_age, max_allowed_comm: @lppi_rate.max_allowed_comm, max_annual_rate: @lppi_rate.max_annual_rate, max_coverage: @lppi_rate.max_coverage, max_monthly_rate: @lppi_rate.max_monthly_rate, min_age: @lppi_rate.min_age, min_annual_rate: @lppi_rate.min_annual_rate, min_coverage: @lppi_rate.min_coverage, min_monthly_rate: @lppi_rate.min_monthly_rate, rider_adb_id: @lppi_rate.rider_adb_id, rider_add_tpd_id: @lppi_rate.rider_add_tpd_id } }
    assert_redirected_to lppi_rate_url(@lppi_rate)
  end

  test "should destroy lppi_rate" do
    assert_difference("LppiRate.count", -1) do
      delete lppi_rate_url(@lppi_rate)
    end

    assert_redirected_to lppi_rates_url
  end
end

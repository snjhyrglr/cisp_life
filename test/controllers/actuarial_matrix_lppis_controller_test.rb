require "test_helper"

class ActuarialMatrixLppisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @actuarial_matrix_lppi = actuarial_matrix_lppis(:one)
  end

  test "should get index" do
    get actuarial_matrix_lppis_url
    assert_response :success
  end

  test "should get new" do
    get new_actuarial_matrix_lppi_url
    assert_response :success
  end

  test "should create actuarial_matrix_lppi" do
    assert_difference("ActuarialMatrixLppi.count") do
      post actuarial_matrix_lppis_url, params: { actuarial_matrix_lppi: { max_age: @actuarial_matrix_lppi.max_age, max_allowed_comm: @actuarial_matrix_lppi.max_allowed_comm, max_annual_prem_rate: @actuarial_matrix_lppi.max_annual_prem_rate, min_age: @actuarial_matrix_lppi.min_age, min_annual_prem_rate: @actuarial_matrix_lppi.min_annual_prem_rate, rider_adb_id: @actuarial_matrix_lppi.rider_adb_id, rider_add_tpd_id: @actuarial_matrix_lppi.rider_add_tpd_id } }
    end

    assert_redirected_to actuarial_matrix_lppi_url(ActuarialMatrixLppi.last)
  end

  test "should show actuarial_matrix_lppi" do
    get actuarial_matrix_lppi_url(@actuarial_matrix_lppi)
    assert_response :success
  end

  test "should get edit" do
    get edit_actuarial_matrix_lppi_url(@actuarial_matrix_lppi)
    assert_response :success
  end

  test "should update actuarial_matrix_lppi" do
    patch actuarial_matrix_lppi_url(@actuarial_matrix_lppi), params: { actuarial_matrix_lppi: { max_age: @actuarial_matrix_lppi.max_age, max_allowed_comm: @actuarial_matrix_lppi.max_allowed_comm, max_annual_prem_rate: @actuarial_matrix_lppi.max_annual_prem_rate, min_age: @actuarial_matrix_lppi.min_age, min_annual_prem_rate: @actuarial_matrix_lppi.min_annual_prem_rate, rider_adb_id: @actuarial_matrix_lppi.rider_adb_id, rider_add_tpd_id: @actuarial_matrix_lppi.rider_add_tpd_id } }
    assert_redirected_to actuarial_matrix_lppi_url(@actuarial_matrix_lppi)
  end

  test "should destroy actuarial_matrix_lppi" do
    assert_difference("ActuarialMatrixLppi.count", -1) do
      delete actuarial_matrix_lppi_url(@actuarial_matrix_lppi)
    end

    assert_redirected_to actuarial_matrix_lppis_url
  end
end

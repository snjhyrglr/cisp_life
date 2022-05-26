require "test_helper"

class RiderAddTpdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rider_add_tpd = rider_add_tpds(:one)
  end

  test "should get index" do
    get rider_add_tpds_url
    assert_response :success
  end

  test "should get new" do
    get new_rider_add_tpd_url
    assert_response :success
  end

  test "should create rider_add_tpd" do
    assert_difference("RiderAddTpd.count") do
      post rider_add_tpds_url, params: { rider_add_tpd: { rate: @rider_add_tpd.rate } }
    end

    assert_redirected_to rider_add_tpd_url(RiderAddTpd.last)
  end

  test "should show rider_add_tpd" do
    get rider_add_tpd_url(@rider_add_tpd)
    assert_response :success
  end

  test "should get edit" do
    get edit_rider_add_tpd_url(@rider_add_tpd)
    assert_response :success
  end

  test "should update rider_add_tpd" do
    patch rider_add_tpd_url(@rider_add_tpd), params: { rider_add_tpd: { rate: @rider_add_tpd.rate } }
    assert_redirected_to rider_add_tpd_url(@rider_add_tpd)
  end

  test "should destroy rider_add_tpd" do
    assert_difference("RiderAddTpd.count", -1) do
      delete rider_add_tpd_url(@rider_add_tpd)
    end

    assert_redirected_to rider_add_tpds_url
  end
end

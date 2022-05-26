require "test_helper"

class RiderAdbsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rider_adb = rider_adbs(:one)
  end

  test "should get index" do
    get rider_adbs_url
    assert_response :success
  end

  test "should get new" do
    get new_rider_adb_url
    assert_response :success
  end

  test "should create rider_adb" do
    assert_difference("RiderAdb.count") do
      post rider_adbs_url, params: { rider_adb: { rate: @rider_adb.rate } }
    end

    assert_redirected_to rider_adb_url(RiderAdb.last)
  end

  test "should show rider_adb" do
    get rider_adb_url(@rider_adb)
    assert_response :success
  end

  test "should get edit" do
    get edit_rider_adb_url(@rider_adb)
    assert_response :success
  end

  test "should update rider_adb" do
    patch rider_adb_url(@rider_adb), params: { rider_adb: { rate: @rider_adb.rate } }
    assert_redirected_to rider_adb_url(@rider_adb)
  end

  test "should destroy rider_adb" do
    assert_difference("RiderAdb.count", -1) do
      delete rider_adb_url(@rider_adb)
    end

    assert_redirected_to rider_adbs_url
  end
end

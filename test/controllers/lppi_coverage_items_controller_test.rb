require "test_helper"

class LppiCoverageItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lppi_coverage_item = lppi_coverage_items(:one)
  end

  test "should get index" do
    get lppi_coverage_items_url
    assert_response :success
  end

  test "should get new" do
    get new_lppi_coverage_item_url
    assert_response :success
  end

  test "should create lppi_coverage_item" do
    assert_difference("LppiCoverageItem.count") do
      post lppi_coverage_items_url, params: { lppi_coverage_item: { coverage: @lppi_coverage_item.coverage, gross_prem: @lppi_coverage_item.gross_prem, lppi_coverage_id: @lppi_coverage_item.lppi_coverage_id, member_id: @lppi_coverage_item.member_id, net_prem: @lppi_coverage_item.net_prem, prem_rate: @lppi_coverage_item.prem_rate, rate_id: @lppi_coverage_item.rate_id, service_fee: @lppi_coverage_item.service_fee } }
    end

    assert_redirected_to lppi_coverage_item_url(LppiCoverageItem.last)
  end

  test "should show lppi_coverage_item" do
    get lppi_coverage_item_url(@lppi_coverage_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_lppi_coverage_item_url(@lppi_coverage_item)
    assert_response :success
  end

  test "should update lppi_coverage_item" do
    patch lppi_coverage_item_url(@lppi_coverage_item), params: { lppi_coverage_item: { coverage: @lppi_coverage_item.coverage, gross_prem: @lppi_coverage_item.gross_prem, lppi_coverage_id: @lppi_coverage_item.lppi_coverage_id, member_id: @lppi_coverage_item.member_id, net_prem: @lppi_coverage_item.net_prem, prem_rate: @lppi_coverage_item.prem_rate, rate_id: @lppi_coverage_item.rate_id, service_fee: @lppi_coverage_item.service_fee } }
    assert_redirected_to lppi_coverage_item_url(@lppi_coverage_item)
  end

  test "should destroy lppi_coverage_item" do
    assert_difference("LppiCoverageItem.count", -1) do
      delete lppi_coverage_item_url(@lppi_coverage_item)
    end

    assert_redirected_to lppi_coverage_items_url
  end
end

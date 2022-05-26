require "test_helper"

class LppiCoveragesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lppi_coverage = lppi_coverages(:one)
  end

  test "should get index" do
    get lppi_coverages_url
    assert_response :success
  end

  test "should get new" do
    get new_lppi_coverage_url
    assert_response :success
  end

  test "should create lppi_coverage" do
    assert_difference("LppiCoverage.count") do
      post lppi_coverages_url, params: { lppi_coverage: { age: @lppi_coverage.age, batch_id: @lppi_coverage.batch_id, cooperative_branch_id: @lppi_coverage.cooperative_branch_id, cooperative_id: @lppi_coverage.cooperative_id, coverage: @lppi_coverage.coverage, effectivity: @lppi_coverage.effectivity, expiry: @lppi_coverage.expiry, gross_prem: @lppi_coverage.gross_prem, member_id: @lppi_coverage.member_id, net_prem: @lppi_coverage.net_prem, product_id: @lppi_coverage.product_id, service_fee: @lppi_coverage.service_fee, terms: @lppi_coverage.terms } }
    end

    assert_redirected_to lppi_coverage_url(LppiCoverage.last)
  end

  test "should show lppi_coverage" do
    get lppi_coverage_url(@lppi_coverage)
    assert_response :success
  end

  test "should get edit" do
    get edit_lppi_coverage_url(@lppi_coverage)
    assert_response :success
  end

  test "should update lppi_coverage" do
    patch lppi_coverage_url(@lppi_coverage), params: { lppi_coverage: { age: @lppi_coverage.age, batch_id: @lppi_coverage.batch_id, cooperative_branch_id: @lppi_coverage.cooperative_branch_id, cooperative_id: @lppi_coverage.cooperative_id, coverage: @lppi_coverage.coverage, effectivity: @lppi_coverage.effectivity, expiry: @lppi_coverage.expiry, gross_prem: @lppi_coverage.gross_prem, member_id: @lppi_coverage.member_id, net_prem: @lppi_coverage.net_prem, product_id: @lppi_coverage.product_id, service_fee: @lppi_coverage.service_fee, terms: @lppi_coverage.terms } }
    assert_redirected_to lppi_coverage_url(@lppi_coverage)
  end

  test "should destroy lppi_coverage" do
    assert_difference("LppiCoverage.count", -1) do
      delete lppi_coverage_url(@lppi_coverage)
    end

    assert_redirected_to lppi_coverages_url
  end
end

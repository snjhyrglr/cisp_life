require "application_system_test_case"

class LppiCoveragesTest < ApplicationSystemTestCase
  setup do
    @lppi_coverage = lppi_coverages(:one)
  end

  test "visiting the index" do
    visit lppi_coverages_url
    assert_selector "h1", text: "Lppi coverages"
  end

  test "should create lppi coverage" do
    visit lppi_coverages_url
    click_on "New lppi coverage"

    fill_in "Age", with: @lppi_coverage.age
    fill_in "Batch", with: @lppi_coverage.batch_id
    fill_in "Cooperative branch", with: @lppi_coverage.cooperative_branch_id
    fill_in "Cooperative", with: @lppi_coverage.cooperative_id
    fill_in "Coverage", with: @lppi_coverage.coverage
    fill_in "Effectivity", with: @lppi_coverage.effectivity
    fill_in "Expiry", with: @lppi_coverage.expiry
    fill_in "Gross prem", with: @lppi_coverage.gross_prem
    fill_in "Member", with: @lppi_coverage.member_id
    fill_in "Net prem", with: @lppi_coverage.net_prem
    fill_in "Product", with: @lppi_coverage.product_id
    fill_in "Service fee", with: @lppi_coverage.service_fee
    fill_in "Terms", with: @lppi_coverage.terms
    click_on "Create Lppi coverage"

    assert_text "Lppi coverage was successfully created"
    click_on "Back"
  end

  test "should update Lppi coverage" do
    visit lppi_coverage_url(@lppi_coverage)
    click_on "Edit this lppi coverage", match: :first

    fill_in "Age", with: @lppi_coverage.age
    fill_in "Batch", with: @lppi_coverage.batch_id
    fill_in "Cooperative branch", with: @lppi_coverage.cooperative_branch_id
    fill_in "Cooperative", with: @lppi_coverage.cooperative_id
    fill_in "Coverage", with: @lppi_coverage.coverage
    fill_in "Effectivity", with: @lppi_coverage.effectivity
    fill_in "Expiry", with: @lppi_coverage.expiry
    fill_in "Gross prem", with: @lppi_coverage.gross_prem
    fill_in "Member", with: @lppi_coverage.member_id
    fill_in "Net prem", with: @lppi_coverage.net_prem
    fill_in "Product", with: @lppi_coverage.product_id
    fill_in "Service fee", with: @lppi_coverage.service_fee
    fill_in "Terms", with: @lppi_coverage.terms
    click_on "Update Lppi coverage"

    assert_text "Lppi coverage was successfully updated"
    click_on "Back"
  end

  test "should destroy Lppi coverage" do
    visit lppi_coverage_url(@lppi_coverage)
    click_on "Destroy this lppi coverage", match: :first

    assert_text "Lppi coverage was successfully destroyed"
  end
end

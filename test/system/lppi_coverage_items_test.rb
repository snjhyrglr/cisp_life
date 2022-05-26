require "application_system_test_case"

class LppiCoverageItemsTest < ApplicationSystemTestCase
  setup do
    @lppi_coverage_item = lppi_coverage_items(:one)
  end

  test "visiting the index" do
    visit lppi_coverage_items_url
    assert_selector "h1", text: "Lppi coverage items"
  end

  test "should create lppi coverage item" do
    visit lppi_coverage_items_url
    click_on "New lppi coverage item"

    fill_in "Coverage", with: @lppi_coverage_item.coverage
    fill_in "Gross prem", with: @lppi_coverage_item.gross_prem
    fill_in "Lppi coverage", with: @lppi_coverage_item.lppi_coverage_id
    fill_in "Member", with: @lppi_coverage_item.member_id
    fill_in "Net prem", with: @lppi_coverage_item.net_prem
    fill_in "Prem rate", with: @lppi_coverage_item.prem_rate
    fill_in "Rate", with: @lppi_coverage_item.rate_id
    fill_in "Service fee", with: @lppi_coverage_item.service_fee
    click_on "Create Lppi coverage item"

    assert_text "Lppi coverage item was successfully created"
    click_on "Back"
  end

  test "should update Lppi coverage item" do
    visit lppi_coverage_item_url(@lppi_coverage_item)
    click_on "Edit this lppi coverage item", match: :first

    fill_in "Coverage", with: @lppi_coverage_item.coverage
    fill_in "Gross prem", with: @lppi_coverage_item.gross_prem
    fill_in "Lppi coverage", with: @lppi_coverage_item.lppi_coverage_id
    fill_in "Member", with: @lppi_coverage_item.member_id
    fill_in "Net prem", with: @lppi_coverage_item.net_prem
    fill_in "Prem rate", with: @lppi_coverage_item.prem_rate
    fill_in "Rate", with: @lppi_coverage_item.rate_id
    fill_in "Service fee", with: @lppi_coverage_item.service_fee
    click_on "Update Lppi coverage item"

    assert_text "Lppi coverage item was successfully updated"
    click_on "Back"
  end

  test "should destroy Lppi coverage item" do
    visit lppi_coverage_item_url(@lppi_coverage_item)
    click_on "Destroy this lppi coverage item", match: :first

    assert_text "Lppi coverage item was successfully destroyed"
  end
end

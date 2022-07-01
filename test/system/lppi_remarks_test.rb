require "application_system_test_case"

class LppiRemarksTest < ApplicationSystemTestCase
  setup do
    @lppi_remark = lppi_remarks(:one)
  end

  test "visiting the index" do
    visit lppi_remarks_url
    assert_selector "h1", text: "Lppi remarks"
  end

  test "should create lppi remark" do
    visit lppi_remarks_url
    click_on "New lppi remark"

    fill_in "Quote item", with: @lppi_remark.quote_item_id
    fill_in "Remarks", with: @lppi_remark.remarks
    click_on "Create Lppi remark"

    assert_text "Lppi remark was successfully created"
    click_on "Back"
  end

  test "should update Lppi remark" do
    visit lppi_remark_url(@lppi_remark)
    click_on "Edit this lppi remark", match: :first

    fill_in "Quote item", with: @lppi_remark.quote_item_id
    fill_in "Remarks", with: @lppi_remark.remarks
    click_on "Update Lppi remark"

    assert_text "Lppi remark was successfully updated"
    click_on "Back"
  end

  test "should destroy Lppi remark" do
    visit lppi_remark_url(@lppi_remark)
    click_on "Destroy this lppi remark", match: :first

    assert_text "Lppi remark was successfully destroyed"
  end
end

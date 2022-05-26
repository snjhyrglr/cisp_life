require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:one)
  end

  test "visiting the index" do
    visit quotes_url
    assert_selector "h1", text: "Quotes"
  end

  test "should create quote" do
    visit quotes_url
    click_on "New quote"

    fill_in "Cooperative branch", with: @quote.cooperative_branch_id
    fill_in "Cooperative", with: @quote.cooperative_id
    fill_in "Description", with: @quote.description
    fill_in "Gross prem", with: @quote.gross_prem
    fill_in "Name", with: @quote.name
    fill_in "Net prem", with: @quote.net_prem
    fill_in "Product", with: @quote.product_id
    fill_in "Service fee", with: @quote.service_fee
    click_on "Create Quote"

    assert_text "Quote was successfully created"
    click_on "Back"
  end

  test "should update Quote" do
    visit quote_url(@quote)
    click_on "Edit this quote", match: :first

    fill_in "Cooperative branch", with: @quote.cooperative_branch_id
    fill_in "Cooperative", with: @quote.cooperative_id
    fill_in "Description", with: @quote.description
    fill_in "Gross prem", with: @quote.gross_prem
    fill_in "Name", with: @quote.name
    fill_in "Net prem", with: @quote.net_prem
    fill_in "Product", with: @quote.product_id
    fill_in "Service fee", with: @quote.service_fee
    click_on "Update Quote"

    assert_text "Quote was successfully updated"
    click_on "Back"
  end

  test "should destroy Quote" do
    visit quote_url(@quote)
    click_on "Destroy this quote", match: :first

    assert_text "Quote was successfully destroyed"
  end
end

require "test_helper"

class QuoteItemControllerTest < ActionDispatch::IntegrationTest
  test "should get approve" do
    get quote_item_approve_url
    assert_response :success
  end
end

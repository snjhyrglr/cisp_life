require "test_helper"

class LppiRemarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lppi_remark = lppi_remarks(:one)
  end

  test "should get index" do
    get lppi_remarks_url
    assert_response :success
  end

  test "should get new" do
    get new_lppi_remark_url
    assert_response :success
  end

  test "should create lppi_remark" do
    assert_difference("LppiRemark.count") do
      post lppi_remarks_url, params: { lppi_remark: { quote_item_id: @lppi_remark.quote_item_id, remarks: @lppi_remark.remarks } }
    end

    assert_redirected_to lppi_remark_url(LppiRemark.last)
  end

  test "should show lppi_remark" do
    get lppi_remark_url(@lppi_remark)
    assert_response :success
  end

  test "should get edit" do
    get edit_lppi_remark_url(@lppi_remark)
    assert_response :success
  end

  test "should update lppi_remark" do
    patch lppi_remark_url(@lppi_remark), params: { lppi_remark: { quote_item_id: @lppi_remark.quote_item_id, remarks: @lppi_remark.remarks } }
    assert_redirected_to lppi_remark_url(@lppi_remark)
  end

  test "should destroy lppi_remark" do
    assert_difference("LppiRemark.count", -1) do
      delete lppi_remark_url(@lppi_remark)
    end

    assert_redirected_to lppi_remarks_url
  end
end

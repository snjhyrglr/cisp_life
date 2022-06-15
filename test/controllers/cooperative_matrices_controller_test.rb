require "test_helper"

class CooperativeMatricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cooperative_matrix = cooperative_matrices(:one)
  end

  test "should get index" do
    get cooperative_matrices_url
    assert_response :success
  end

  test "should get new" do
    get new_cooperative_matrix_url
    assert_response :success
  end

  test "should create cooperative_matrix" do
    assert_difference("CooperativeMatrix.count") do
      post cooperative_matrices_url, params: { cooperative_matrix: { coop_service_fee: @cooperative_matrix.coop_service_fee, cooperative_id: @cooperative_matrix.cooperative_id, cooperative_incharge: @cooperative_matrix.cooperative_incharge, incharge_position: @cooperative_matrix.incharge_position, premium_rate: @cooperative_matrix.premium_rate } }
    end

    assert_redirected_to cooperative_matrix_url(CooperativeMatrix.last)
  end

  test "should show cooperative_matrix" do
    get cooperative_matrix_url(@cooperative_matrix)
    assert_response :success
  end

  test "should get edit" do
    get edit_cooperative_matrix_url(@cooperative_matrix)
    assert_response :success
  end

  test "should update cooperative_matrix" do
    patch cooperative_matrix_url(@cooperative_matrix), params: { cooperative_matrix: { coop_service_fee: @cooperative_matrix.coop_service_fee, cooperative_id: @cooperative_matrix.cooperative_id, cooperative_incharge: @cooperative_matrix.cooperative_incharge, incharge_position: @cooperative_matrix.incharge_position, premium_rate: @cooperative_matrix.premium_rate } }
    assert_redirected_to cooperative_matrix_url(@cooperative_matrix)
  end

  test "should destroy cooperative_matrix" do
    assert_difference("CooperativeMatrix.count", -1) do
      delete cooperative_matrix_url(@cooperative_matrix)
    end

    assert_redirected_to cooperative_matrices_url
  end
end

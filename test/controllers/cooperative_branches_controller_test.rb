require "test_helper"

class CooperativeBranchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cooperative_branch = cooperative_branches(:one)
  end

  test "should get index" do
    get cooperative_branches_url
    assert_response :success
  end

  test "should get new" do
    get new_cooperative_branch_url
    assert_response :success
  end

  test "should create cooperative_branch" do
    assert_difference("CooperativeBranch.count") do
      post cooperative_branches_url, params: { cooperative_branch: { address: @cooperative_branch.address, cooperative_id: @cooperative_branch.cooperative_id, name: @cooperative_branch.name } }
    end

    assert_redirected_to cooperative_branch_url(CooperativeBranch.last)
  end

  test "should show cooperative_branch" do
    get cooperative_branch_url(@cooperative_branch)
    assert_response :success
  end

  test "should get edit" do
    get edit_cooperative_branch_url(@cooperative_branch)
    assert_response :success
  end

  test "should update cooperative_branch" do
    patch cooperative_branch_url(@cooperative_branch), params: { cooperative_branch: { address: @cooperative_branch.address, cooperative_id: @cooperative_branch.cooperative_id, name: @cooperative_branch.name } }
    assert_redirected_to cooperative_branch_url(@cooperative_branch)
  end

  test "should destroy cooperative_branch" do
    assert_difference("CooperativeBranch.count", -1) do
      delete cooperative_branch_url(@cooperative_branch)
    end

    assert_redirected_to cooperative_branches_url
  end
end

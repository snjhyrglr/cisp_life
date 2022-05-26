require "test_helper"

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = members(:one)
  end

  test "should get index" do
    get members_url
    assert_response :success
  end

  test "should get new" do
    get new_member_url
    assert_response :success
  end

  test "should create member" do
    assert_difference("Member.count") do
      post members_url, params: { member: { birthdate: @member.birthdate, cooperative_branch_id_id: @member.cooperative_branch_id_id, cooperative_id_id: @member.cooperative_id_id, firstName: @member.firstName, gender: @member.gender, lastName: @member.lastName, middleName: @member.middleName, suffix: @member.suffix } }
    end

    assert_redirected_to member_url(Member.last)
  end

  test "should show member" do
    get member_url(@member)
    assert_response :success
  end

  test "should get edit" do
    get edit_member_url(@member)
    assert_response :success
  end

  test "should update member" do
    patch member_url(@member), params: { member: { birthdate: @member.birthdate, cooperative_branch_id_id: @member.cooperative_branch_id_id, cooperative_id_id: @member.cooperative_id_id, firstName: @member.firstName, gender: @member.gender, lastName: @member.lastName, middleName: @member.middleName, suffix: @member.suffix } }
    assert_redirected_to member_url(@member)
  end

  test "should destroy member" do
    assert_difference("Member.count", -1) do
      delete member_url(@member)
    end

    assert_redirected_to members_url
  end
end

require "application_system_test_case"

class CooperativeMatricesTest < ApplicationSystemTestCase
  setup do
    @cooperative_matrix = cooperative_matrices(:one)
  end

  test "visiting the index" do
    visit cooperative_matrices_url
    assert_selector "h1", text: "Cooperative matrices"
  end

  test "should create cooperative matrix" do
    visit cooperative_matrices_url
    click_on "New cooperative matrix"

    fill_in "Coop service fee", with: @cooperative_matrix.coop_service_fee
    fill_in "Cooperative", with: @cooperative_matrix.cooperative_id
    fill_in "Cooperative incharge", with: @cooperative_matrix.cooperative_incharge
    fill_in "Incharge position", with: @cooperative_matrix.incharge_position
    fill_in "Premium rate", with: @cooperative_matrix.premium_rate
    click_on "Create Cooperative matrix"

    assert_text "Cooperative matrix was successfully created"
    click_on "Back"
  end

  test "should update Cooperative matrix" do
    visit cooperative_matrix_url(@cooperative_matrix)
    click_on "Edit this cooperative matrix", match: :first

    fill_in "Coop service fee", with: @cooperative_matrix.coop_service_fee
    fill_in "Cooperative", with: @cooperative_matrix.cooperative_id
    fill_in "Cooperative incharge", with: @cooperative_matrix.cooperative_incharge
    fill_in "Incharge position", with: @cooperative_matrix.incharge_position
    fill_in "Premium rate", with: @cooperative_matrix.premium_rate
    click_on "Update Cooperative matrix"

    assert_text "Cooperative matrix was successfully updated"
    click_on "Back"
  end

  test "should destroy Cooperative matrix" do
    visit cooperative_matrix_url(@cooperative_matrix)
    click_on "Destroy this cooperative matrix", match: :first

    assert_text "Cooperative matrix was successfully destroyed"
  end
end

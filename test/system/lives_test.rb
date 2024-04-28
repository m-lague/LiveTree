require "application_system_test_case"

class LivesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit lives_url
  #
  #   assert_selector "h1", text: "Lives"
  # end
  setup do
    @live = lives(:one) # Reference to the first fixture live
  end
  test "Creation d'un live" do
    visit lives_path
    assert_selector "h1", text: "Lives"

    click_on "New live"
    assert_selector "h1", text: "New live"

    fill_in "Title", with: "Mon premier live"
    fill_in "Description", with: "Ceci est mon tout premier live j'espère que vous serez nombreux à le visionner"

    click_on "Create live"

    assert_selector "h1", text: "Lives"
    assert_text "Mon premier live"
  end

  test "Voir la fiche d'un live" do
    visit lives_path
    click_link @live.title

    assert_selector "h1", text: @live.title
  end

  test "Editer un Live" do
    visit lives_path
    assert_selector "h1", text: "Lives"

    click_on "Edit", match: :one
    assert_selector "h1", text: "Edit Live"

    fill_in "Title", with: "Updated Live"
    click_on "Update Live"

    assert_selector "h1", text: "Lives"
    assert_text "Updated Live"
  end

  test "Detruire a live" do
    visit lives_path
    assert_text @live.title

    click_on "Delete", match: :one
    assert_no_text @live.title
  end
end

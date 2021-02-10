require "application_system_test_case"

class BodyOfWatersTest < ApplicationSystemTestCase
  setup do
    @body_of_water = body_of_waters(:one)
  end

  test "visiting the index" do
    visit body_of_waters_url
    assert_selector "h1", text: "Body Of Waters"
  end

  test "creating a Body of water" do
    visit body_of_waters_url
    click_on "New Body Of Water"

    fill_in "Name", with: @body_of_water.name
    click_on "Create Body of water"

    assert_text "Body of water was successfully created"
    click_on "Back"
  end

  test "updating a Body of water" do
    visit body_of_waters_url
    click_on "Edit", match: :first

    fill_in "Name", with: @body_of_water.name
    click_on "Update Body of water"

    assert_text "Body of water was successfully updated"
    click_on "Back"
  end

  test "destroying a Body of water" do
    visit body_of_waters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Body of water was successfully destroyed"
  end
end

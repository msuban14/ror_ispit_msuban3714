require "application_system_test_case"

class FisheriesTest < ApplicationSystemTestCase
  setup do
    @fishery = fisheries(:one)
  end

  test "visiting the index" do
    visit fisheries_url
    assert_selector "h1", text: "Fisheries"
  end

  test "creating a Fishery" do
    visit fisheries_url
    click_on "New Fishery"

    fill_in "Description", with: @fishery.description
    fill_in "Name", with: @fishery.name
    click_on "Create Fishery"

    assert_text "Fishery was successfully created"
    click_on "Back"
  end

  test "updating a Fishery" do
    visit fisheries_url
    click_on "Edit", match: :first

    fill_in "Description", with: @fishery.description
    fill_in "Name", with: @fishery.name
    click_on "Update Fishery"

    assert_text "Fishery was successfully updated"
    click_on "Back"
  end

  test "destroying a Fishery" do
    visit fisheries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fishery was successfully destroyed"
  end
end

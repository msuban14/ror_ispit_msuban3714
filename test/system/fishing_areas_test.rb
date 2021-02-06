require "application_system_test_case"

class FishingAreasTest < ApplicationSystemTestCase
  setup do
    @fishing_area = fishing_areas(:one)
  end

  test "visiting the index" do
    visit fishing_areas_url
    assert_selector "h1", text: "Fishing Areas"
  end

  test "creating a Fishing area" do
    visit fishing_areas_url
    click_on "New Fishing Area"

    fill_in "Description", with: @fishing_area.description
    fill_in "Name", with: @fishing_area.name
    fill_in "User", with: @fishing_area.user
    fill_in "Views", with: @fishing_area.views
    click_on "Create Fishing area"

    assert_text "Fishing area was successfully created"
    click_on "Back"
  end

  test "updating a Fishing area" do
    visit fishing_areas_url
    click_on "Edit", match: :first

    fill_in "Description", with: @fishing_area.description
    fill_in "Name", with: @fishing_area.name
    fill_in "User", with: @fishing_area.user
    fill_in "Views", with: @fishing_area.views
    click_on "Update Fishing area"

    assert_text "Fishing area was successfully updated"
    click_on "Back"
  end

  test "destroying a Fishing area" do
    visit fishing_areas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fishing area was successfully destroyed"
  end
end

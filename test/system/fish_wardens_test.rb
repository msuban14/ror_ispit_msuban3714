require "application_system_test_case"

class FishWardensTest < ApplicationSystemTestCase
  setup do
    @fish_warden = fish_wardens(:one)
  end

  test "visiting the index" do
    visit fish_wardens_url
    assert_selector "h1", text: "Fish Wardens"
  end

  test "creating a Fish warden" do
    visit fish_wardens_url
    click_on "New Fish Warden"

    fill_in "Name", with: @fish_warden.name
    fill_in "Phone", with: @fish_warden.phone
    click_on "Create Fish warden"

    assert_text "Fish warden was successfully created"
    click_on "Back"
  end

  test "updating a Fish warden" do
    visit fish_wardens_url
    click_on "Edit", match: :first

    fill_in "Name", with: @fish_warden.name
    fill_in "Phone", with: @fish_warden.phone
    click_on "Update Fish warden"

    assert_text "Fish warden was successfully updated"
    click_on "Back"
  end

  test "destroying a Fish warden" do
    visit fish_wardens_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fish warden was successfully destroyed"
  end
end

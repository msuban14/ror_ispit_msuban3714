require "application_system_test_case"

class LicenceIssuersTest < ApplicationSystemTestCase
  setup do
    @licence_issuer = licence_issuers(:one)
  end

  test "visiting the index" do
    visit licence_issuers_url
    assert_selector "h1", text: "Licence Issuers"
  end

  test "creating a Licence issuer" do
    visit licence_issuers_url
    click_on "New Licence Issuer"

    fill_in "Name", with: @licence_issuer.name
    click_on "Create Licence issuer"

    assert_text "Licence issuer was successfully created"
    click_on "Back"
  end

  test "updating a Licence issuer" do
    visit licence_issuers_url
    click_on "Edit", match: :first

    fill_in "Name", with: @licence_issuer.name
    click_on "Update Licence issuer"

    assert_text "Licence issuer was successfully updated"
    click_on "Back"
  end

  test "destroying a Licence issuer" do
    visit licence_issuers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Licence issuer was successfully destroyed"
  end
end

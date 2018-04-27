require "application_system_test_case"

class MinimusTest < ApplicationSystemTestCase
  setup do
    @minimu = minimus(:one)
  end

  test "visiting the index" do
    visit minimus_url
    assert_selector "h1", text: "Minimus"
  end

  test "creating a Minimu" do
    visit minimus_url
    click_on "New Minimu"

    fill_in "Long Url", with: @minimu.long_url
    fill_in "Short Url", with: @minimu.short_url
    click_on "Create Minimu"

    assert_text "Minimu was successfully created"
    click_on "Back"
  end

  test "updating a Minimu" do
    visit minimus_url
    click_on "Edit", match: :first

    fill_in "Long Url", with: @minimu.long_url
    fill_in "Short Url", with: @minimu.short_url
    click_on "Update Minimu"

    assert_text "Minimu was successfully updated"
    click_on "Back"
  end

  test "destroying a Minimu" do
    visit minimus_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Minimu was successfully destroyed"
  end
end

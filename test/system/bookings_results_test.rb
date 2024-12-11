require "application_system_test_case"

class BookingsResultsTest < ApplicationSystemTestCase
  setup do
    @bookings_result = bookings_results(:one)
  end

  test "visiting the index" do
    visit bookings_results_url
    assert_selector "h1", text: "Bookings results"
  end

  test "should create bookings result" do
    visit bookings_results_url
    click_on "New bookings result"

    fill_in "Booking", with: @bookings_result.booking_id
    fill_in "Result", with: @bookings_result.result_id
    click_on "Create Bookings result"

    assert_text "Bookings result was successfully created"
    click_on "Back"
  end

  test "should update Bookings result" do
    visit bookings_result_url(@bookings_result)
    click_on "Edit this bookings result", match: :first

    fill_in "Booking", with: @bookings_result.booking_id
    fill_in "Result", with: @bookings_result.result_id
    click_on "Update Bookings result"

    assert_text "Bookings result was successfully updated"
    click_on "Back"
  end

  test "should destroy Bookings result" do
    visit bookings_result_url(@bookings_result)
    click_on "Destroy this bookings result", match: :first

    assert_text "Bookings result was successfully destroyed"
  end
end

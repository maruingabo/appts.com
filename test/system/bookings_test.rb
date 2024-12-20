require "application_system_test_case"

class BookingsTest < ApplicationSystemTestCase
  setup do
    @booking = bookings(:one)
  end

  test "visiting the index" do
    visit bookings_url
    assert_selector "h1", text: "Bookings"
  end

  test "should create booking" do
    visit bookings_url
    click_on "New booking"

    fill_in "Booked date", with: @booking.booked_date
    fill_in "Description", with: @booking.description
    fill_in "Email", with: @booking.email
    fill_in "Establishment", with: @booking.establishment_id
    fill_in "First name", with: @booking.first_name
    fill_in "Last name", with: @booking.last_name
    fill_in "Middle name", with: @booking.middle_name
    fill_in "Phone number", with: @booking.phone_number
    fill_in "Que number", with: @booking.que_number
    fill_in "Status", with: @booking.status
    click_on "Create Booking"

    assert_text "Booking was successfully created"
    click_on "Back"
  end

  test "should update Booking" do
    visit booking_url(@booking)
    click_on "Edit this booking", match: :first

    fill_in "Booked date", with: @booking.booked_date
    fill_in "Description", with: @booking.description
    fill_in "Email", with: @booking.email
    fill_in "Establishment", with: @booking.establishment_id
    fill_in "First name", with: @booking.first_name
    fill_in "Last name", with: @booking.last_name
    fill_in "Middle name", with: @booking.middle_name
    fill_in "Phone number", with: @booking.phone_number
    fill_in "Que number", with: @booking.que_number
    fill_in "Status", with: @booking.status
    click_on "Update Booking"

    assert_text "Booking was successfully updated"
    click_on "Back"
  end

  test "should destroy Booking" do
    visit booking_url(@booking)
    click_on "Destroy this booking", match: :first

    assert_text "Booking was successfully destroyed"
  end
end

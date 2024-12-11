require "test_helper"

class BookingsServiceOffersControllerTest < ActionDispatch::IntegrationTest
  test "should get bulk_create" do
    get bookings_service_offers_bulk_create_url
    assert_response :success
  end
end

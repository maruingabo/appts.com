require "test_helper"

class BookingsResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bookings_result = bookings_results(:one)
  end

  test "should get index" do
    get bookings_results_url
    assert_response :success
  end

  test "should get new" do
    get new_bookings_result_url
    assert_response :success
  end

  test "should create bookings_result" do
    assert_difference("BookingsResult.count") do
      post bookings_results_url, params: { bookings_result: { booking_id: @bookings_result.booking_id, result_id: @bookings_result.result_id } }
    end

    assert_redirected_to bookings_result_url(BookingsResult.last)
  end

  test "should show bookings_result" do
    get bookings_result_url(@bookings_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_bookings_result_url(@bookings_result)
    assert_response :success
  end

  test "should update bookings_result" do
    patch bookings_result_url(@bookings_result), params: { bookings_result: { booking_id: @bookings_result.booking_id, result_id: @bookings_result.result_id } }
    assert_redirected_to bookings_result_url(@bookings_result)
  end

  test "should destroy bookings_result" do
    assert_difference("BookingsResult.count", -1) do
      delete bookings_result_url(@bookings_result)
    end

    assert_redirected_to bookings_results_url
  end
end

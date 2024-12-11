json.extract! bookings_result, :id, :booking_id, :result_id, :created_at, :updated_at
json.url bookings_result_url(bookings_result, format: :json)

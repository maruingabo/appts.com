json.extract! booking, :id, :establishment_id, :booked_date, :status, :first_name, :last_name, :middle_name, :phone_number, :email, :que_number, :description, :created_at, :updated_at
json.url booking_url(booking, format: :json)

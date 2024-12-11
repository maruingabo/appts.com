class BookingsServiceOffer < ApplicationRecord
  belongs_to :booking
  belongs_to :service_offer

  def self.create_booking_services(booking_id, services_offered)
    services_offered.each do |service|
      service_offer = ServiceOffer.find(service)
      BookingsServiceOffer.find_or_create_by(booking_id: booking_id, service_offer_id: service, booked_price: service_offer.price)
    end
  end
end

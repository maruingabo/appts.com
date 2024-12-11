class BookingsServiceOffersController < ApplicationController
  before_action :set_booking_service_offer, only: %i[ destroy card ]

  def index
  end

  def bulk_create
    @booking = Booking.find(params[:booking_id])
    BookingsServiceOffer.create_booking_services(params[:booking_id], params[:service_offer_ids])
    @booking.update_attribute('status', 'booked')


    redirect_to booking_path(@booking), notice: "Booking completed."
  end

  def destroy
    @booking = @booking_service_offer.booking
    @booking_service_offer.destroy!

    redirect_to booking_path(@booking), notice: "Service successfully removed"
  end

  private

  def set_booking_service_offer
    @booking_service_offer = BookingsServiceOffer.find(params[:id])
  end
end

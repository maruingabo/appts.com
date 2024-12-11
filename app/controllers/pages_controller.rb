class PagesController < ApplicationController
  before_action :authenticate_user!, only: %i[ dashboard ]

  def home
    @booking = Booking.new if request.subdomain.present?
    render 'establishment' if request.subdomain.present?
  end

  def dashboard
    @bookings_today = Booking.bookings_today
  end
end

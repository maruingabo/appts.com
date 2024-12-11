class BookingsController < ApplicationController
  before_action :authenticate_user!, only: %i[ index ]
  before_action :check_if_at_tenant_page
  before_action :set_bookings, only: %i[ index show ]
  before_action :set_booking, only: %i[ show edit update destroy index card]
  before_action :get_services, only: %i[ show ]
  # GET /bookings or /bookings.json
  def index
  end

  # GET /bookings/1 or /bookings/1.json
  def show
    render 'staff_show' if current_user
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new(booking_params)
    respond_to do |format|
      if @booking.save
        format.html { redirect_to booking_path(@booking), notice: "Last step to finish booking" }
        format.json { render 'pages/choose_services', status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        redirect_to booking_url(@booking), notice: "Booking was successfully updated."
        # format.html {  }
        # format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy!

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def card
    render partial: 'bookings/card', locals: { booking: @booking }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_bookings
    @q = Booking.ransack(params[:q])
    @bookings = @q.result(distinct: true)
    @bookings = @bookings.booked
  end

  def set_booking
    @booking = params[:id].present? ? Booking.find(params[:id]) : @bookings.first
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:establishment_id, :booked_date, :email, :first_name, :last_name, :middle_name, :description, :booking_qrcode, :status)
  end

  def check_if_at_tenant_page
    redirect_to root_path if current_tenant.nil?
  end

  def get_services
    @services = ServiceOffer.all
  end
end

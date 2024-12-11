class BookingsResultsController < ApplicationController
  before_action :set_bookings_result, only: %i[ show edit update destroy ]

  # GET /bookings_results or /bookings_results.json
  def index
    @bookings_results = BookingsResult.all
  end

  # GET /bookings_results/1 or /bookings_results/1.json
  def show
  end

  # GET /bookings_results/new
  def new
    @bookings_result = BookingsResult.new
  end

  # GET /bookings_results/1/edit
  def edit
  end

  # POST /bookings_results or /bookings_results.json
  def create
    @bookings_result = BookingsResult.new(bookings_result_params)

    respond_to do |format|
      if @bookings_result.save
        format.html { redirect_to bookings_result_url(@bookings_result), notice: "Bookings result was successfully created." }
        format.json { render :show, status: :created, location: @bookings_result }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bookings_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings_results/1 or /bookings_results/1.json
  def update
    respond_to do |format|
      if @bookings_result.update(bookings_result_params)
        format.html { redirect_to bookings_result_url(@bookings_result), notice: "Bookings result was successfully updated." }
        format.json { render :show, status: :ok, location: @bookings_result }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bookings_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings_results/1 or /bookings_results/1.json
  def destroy
    @bookings_result.destroy!

    respond_to do |format|
      format.html { redirect_to bookings_results_url, notice: "Bookings result was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookings_result
      @bookings_result = BookingsResult.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bookings_result_params
      params.require(:bookings_result).permit(:booking_id, :result_id)
    end
end

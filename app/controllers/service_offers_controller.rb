class ServiceOffersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service_offer, only: %i[ show edit update destroy ]

  # GET /service_offers or /service_offers.json
  def index
    # @service_offers = ServiceOffer.all
    @q = ServiceOffer.ransack(params[:q])
    @service_offers = @q.result(distinct: true)
  end

  # GET /service_offers/1 or /service_offers/1.json
  def show
  end

  # GET /service_offers/new
  def new
    @service_offer = ServiceOffer.new
  end

  # GET /service_offers/1/edit
  def edit
  end

  # POST /service_offers or /service_offers.json
  def create
    @service_offer = ServiceOffer.new(service_offer_params)

    respond_to do |format|
      if @service_offer.save
        format.html { redirect_to service_offer_url(@service_offer), notice: "Service offer was successfully created." }
        format.json { render :show, status: :created, location: @service_offer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_offers/1 or /service_offers/1.json
  def update
    respond_to do |format|
      if @service_offer.update(service_offer_params)
        format.html { redirect_to service_offer_url(@service_offer), notice: "Service offer was successfully updated." }
        format.json { render :show, status: :ok, location: @service_offer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_offers/1 or /service_offers/1.json
  def destroy
    @service_offer.destroy!

    respond_to do |format|
      format.html { redirect_to service_offers_url, notice: "Service offer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_offer
      @service_offer = ServiceOffer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_offer_params
      params.require(:service_offer).permit(:establishment_id, :name, :price, :slot, :status, :description)
    end
end

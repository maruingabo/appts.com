require "test_helper"

class ServiceOffersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_offer = service_offers(:one)
  end

  test "should get index" do
    get service_offers_url
    assert_response :success
  end

  test "should get new" do
    get new_service_offer_url
    assert_response :success
  end

  test "should create service_offer" do
    assert_difference("ServiceOffer.count") do
      post service_offers_url, params: { service_offer: { description: @service_offer.description, establishment_id: @service_offer.establishment_id, name: @service_offer.name, price: @service_offer.price, slot: @service_offer.slot, status: @service_offer.status } }
    end

    assert_redirected_to service_offer_url(ServiceOffer.last)
  end

  test "should show service_offer" do
    get service_offer_url(@service_offer)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_offer_url(@service_offer)
    assert_response :success
  end

  test "should update service_offer" do
    patch service_offer_url(@service_offer), params: { service_offer: { description: @service_offer.description, establishment_id: @service_offer.establishment_id, name: @service_offer.name, price: @service_offer.price, slot: @service_offer.slot, status: @service_offer.status } }
    assert_redirected_to service_offer_url(@service_offer)
  end

  test "should destroy service_offer" do
    assert_difference("ServiceOffer.count", -1) do
      delete service_offer_url(@service_offer)
    end

    assert_redirected_to service_offers_url
  end
end

require "application_system_test_case"

class ServiceOffersTest < ApplicationSystemTestCase
  setup do
    @service_offer = service_offers(:one)
  end

  test "visiting the index" do
    visit service_offers_url
    assert_selector "h1", text: "Service offers"
  end

  test "should create service offer" do
    visit service_offers_url
    click_on "New service offer"

    fill_in "Description", with: @service_offer.description
    fill_in "Establishment", with: @service_offer.establishment_id
    fill_in "Name", with: @service_offer.name
    fill_in "Price", with: @service_offer.price
    fill_in "Slot", with: @service_offer.slot
    fill_in "Status", with: @service_offer.status
    click_on "Create Service offer"

    assert_text "Service offer was successfully created"
    click_on "Back"
  end

  test "should update Service offer" do
    visit service_offer_url(@service_offer)
    click_on "Edit this service offer", match: :first

    fill_in "Description", with: @service_offer.description
    fill_in "Establishment", with: @service_offer.establishment_id
    fill_in "Name", with: @service_offer.name
    fill_in "Price", with: @service_offer.price
    fill_in "Slot", with: @service_offer.slot
    fill_in "Status", with: @service_offer.status
    click_on "Update Service offer"

    assert_text "Service offer was successfully updated"
    click_on "Back"
  end

  test "should destroy Service offer" do
    visit service_offer_url(@service_offer)
    click_on "Destroy this service offer", match: :first

    assert_text "Service offer was successfully destroyed"
  end
end

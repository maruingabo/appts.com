json.extract! service_offer, :id, :establishment_id, :name, :price, :slot, :status, :description, :created_at, :updated_at
json.url service_offer_url(service_offer, format: :json)

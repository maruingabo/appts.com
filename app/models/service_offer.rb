class ServiceOffer < ApplicationRecord
  acts_as_tenant :establishment

  has_rich_text :description
  has_many :bookings_service_offers, dependent: :destroy
  has_many :bookings, through: :bookings_service_offers

  STATUSES = [['Published','published'], ['Draft','draft'], ['Discontinued','discontinued']]

  def self.ransackable_attributes(auth_object = nil)
    ['name', 'description']
  end

  def self.ransackable_associations(auth_object = nil)
    ["bookings", "bookings_service_offers", "establishment"]
  end

end

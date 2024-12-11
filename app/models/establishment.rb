class Establishment < ApplicationRecord
  belongs_to :city

  has_many :establishments_users, dependent: :destroy
  has_many :users, through: :establishments_users
  has_many :service_offers, dependent: :destroy
  has_many :bookings, dependent: :destroy
end

class Result < ApplicationRecord
  has_many :bookings_results, dependent: :destroy
  has_many :bookings, through: :bookings_results
end

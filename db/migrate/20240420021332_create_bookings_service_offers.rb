class CreateBookingsServiceOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings_service_offers, id: :uuid do |t|
      t.belongs_to :booking, null: false, foreign_key: true, type: :uuid
      t.belongs_to :service_offer, null: false, foreign_key: true, type: :uuid
      t.decimal :booked_price

      t.timestamps
    end
  end
end

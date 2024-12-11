class CreateBookingsResults < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings_results, id: :uuid do |t|
      t.belongs_to :booking, null: false, foreign_key: true, type: :uuid
      t.belongs_to :result, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end

class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings, id: :uuid do |t|
      t.belongs_to :establishment, null: false, foreign_key: true, type: :uuid
      t.datetime :booked_date
      t.string :status, default: 'pending'
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :phone_number
      t.string :email
      t.string :que_number
      t.text :description

      t.timestamps
    end
  end
end

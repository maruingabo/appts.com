class CreateEstablishments < ActiveRecord::Migration[7.1]
  def change
    create_table :establishments, id: :uuid do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :subdomain
      t.string :domain
      t.string :status, default: 'pending'
      t.integer :booking_offset, default: 0
      t.belongs_to :city, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end

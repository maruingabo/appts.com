class CreateServiceOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :service_offers, id: :uuid do |t|
      t.belongs_to :establishment, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.decimal :price
      t.integer :slot
      t.string :status, default: 'draft'
      t.string :description

      t.timestamps
    end
  end
end

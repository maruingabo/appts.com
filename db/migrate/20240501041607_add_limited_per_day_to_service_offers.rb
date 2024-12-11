class AddLimitedPerDayToServiceOffers < ActiveRecord::Migration[7.1]
  def change
    add_column :service_offers, :limited_per_day, :boolean, default: false
  end
end

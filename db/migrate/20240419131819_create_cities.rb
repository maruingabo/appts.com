class CreateCities < ActiveRecord::Migration[7.1]
  def change
    create_table :cities, id: :uuid do |t|
      t.string :name
      t.belongs_to :province, null: false, foreign_key: true, type: :uuid
      t.string :code

      t.timestamps
    end
  end
end

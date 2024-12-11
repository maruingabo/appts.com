class CreateProvinces < ActiveRecord::Migration[7.1]
  def change
    create_table :provinces, id: :uuid do |t|
      t.string :name
      t.string :code
      t.string :slug

      t.timestamps
    end
  end
end

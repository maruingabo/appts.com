class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results, id: :uuid do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

class CreateEstablishmentsUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :establishments_users, id: :uuid do |t|
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid
      t.belongs_to :establishment, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end

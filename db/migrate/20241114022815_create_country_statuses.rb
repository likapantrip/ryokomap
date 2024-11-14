class CreateCountryStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :country_statuses do |t|
      t.references :user,      null: false, foreign_key: true
      t.references :country,   null: false, foreign_key: true
      t.integer    :status_id, null: false
      t.timestamps
    end
  end
end

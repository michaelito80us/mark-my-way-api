class CreateTripStops < ActiveRecord::Migration[6.0]
  def change
    create_table :trip_stops do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :stop, null: false, foreign_key: true

      t.timestamps
    end
  end
end

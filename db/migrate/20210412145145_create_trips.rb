class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.integer :duration
      t.float :start_lat
      t.float :start_lon
      t.string :status
      t.integer :current_stop

      t.timestamps
    end
  end
end

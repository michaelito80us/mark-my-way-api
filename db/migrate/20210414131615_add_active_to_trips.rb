class AddActiveToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :active, :boolean
  end
end

class RemoveStatusFromTrips < ActiveRecord::Migration[6.0]
  def change
    remove_column :trips, :status
  end
end

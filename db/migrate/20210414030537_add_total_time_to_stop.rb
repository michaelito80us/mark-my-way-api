class AddTotalTimeToStop < ActiveRecord::Migration[6.0]
  def change
    add_column :stops, :total_time, :float
  end
end

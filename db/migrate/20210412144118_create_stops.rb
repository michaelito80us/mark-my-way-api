class CreateStops < ActiveRecord::Migration[6.0]
  def change
    create_table :stops do |t|
      t.float :lat
      t.float :lon
      t.string :name
      t.string :address
      t.string :category
      t.text :photo1
      t.text :photo2
      t.text :photo3
      t.integer :visit_time

      t.timestamps
    end
  end
end

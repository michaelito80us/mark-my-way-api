class AddIntroductionToStops < ActiveRecord::Migration[6.0]
  def change
    add_column :stops, :introduction, :text
  end
end

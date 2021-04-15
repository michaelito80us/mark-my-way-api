class Trip < ApplicationRecord
  has_many :trip_stops, dependent: :destroy
  has_many :stops, through: :trip_stops
  belongs_to :user
end

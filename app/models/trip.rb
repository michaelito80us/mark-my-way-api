class Trip < ApplicationRecord
  has_many :trip_stops
  has_many :stops, through: :trip_stops
end

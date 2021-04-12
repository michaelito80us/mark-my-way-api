class Stop < ApplicationRecord
  has_many :trip_stops
  has_many :trips, through: :trip_stops
end

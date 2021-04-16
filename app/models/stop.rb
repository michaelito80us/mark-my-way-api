class Stop < ApplicationRecord
  has_many :trip_stops
  has_many :trips, through: :trip_stops

  has_many_attached :images

end

json.trip do
  json.extract! @trip, :id, :current_stop, :active, :duration, :start_lat, :start_lon

  json.array! @trip.stops do |stop|

  end
end

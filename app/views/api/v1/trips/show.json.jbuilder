json.trip do
  json.extract! @trip, :id, :current_stop, :active, :duration, :start_lat, :start_lon

  json.stops do
    json.array! @trip.stops do |stop|
      json.extract! stop, :id, :lat, :lon, :name, :address, :category, :photo1, :photo2, :photo3, :introduction, :visit_time
      json.photos(@stop.images.map{ |photo| photo.service_url})
    end
  end
end

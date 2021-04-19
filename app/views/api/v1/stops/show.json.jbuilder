json.stop do
  json.extract! @stop, :id, :address, :name, :category, :photo1, :photo2, :photo3, :visit_time, :introduction
  
  json.photos @stop.images.map{|photo| photo.service_url}
  
end

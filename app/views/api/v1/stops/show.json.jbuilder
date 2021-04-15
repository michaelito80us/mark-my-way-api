json.stop do
  json.extract! @stop, :id, :name, :category, :photo1, :photo2, :photo3, :visit_time, :introduction
  
end

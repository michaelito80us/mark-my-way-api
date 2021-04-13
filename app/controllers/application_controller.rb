class ApplicationController < ActionController::Base
end


start_lat = params[:lat]
start_lon = params[:lon]
trip_time_mins = params[:trip_time]


# initialize remaining time variable
remaining_time_mins = trip_time_mins

# initialize the trip array - array of instances of stops
my_trip = []


while remaining_time_mins.positive?

  # the real time it takes to get to and visit the stop = walk_time + visit_time
  current_stop_time_mins = 0
  remaining_time_mins -= current_stop_time_mins
  
  # calculate the max distance with the time given
  # 83 mts / min is average walking speed
  max_distance_mts = 83 * trip_time_mins
  
  #### find the array of locations between [start_lat,start_lon] and the max_distance_mts
  locations = array_of_locs(start_lat, start_lon, max_distance_mts)


  ### remove the trip stops already selected for the trip from the locations array
  my_trip.each do |stop|
    locations.reject! { |loc| loc.id == stop.id }
  end


  ### find the distance between my current location and all the points in the array,
  ### calculate the total_time = walking time to each distace + the visit time. 
  ### sort by the result by shortest total time
  ### walking time [mins] = distance [mts] / 83

  locations.each do |location|
  # sorted_locs = objects.sort_by(&:total_time)

  ### remove the points in the array where the total time is larger than the remaining_time_mins

  ### get the size of the array_of_locs
  
  ### if its more than 5: 
    ### n = calculate what is the nearest integer to 30% of the size

  ### if its 5 or less:
    ### n = the size af the array_of_locs
  
  ### randomly choose between the first n stops
  sorted_locs[rand(0..n)] 


end  

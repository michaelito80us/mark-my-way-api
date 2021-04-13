class Api::V1::TripsController < Api::V1::BaseController
  def index
    @stories = Story.all
    render json: @stories #Just for testing
  end

  def create

    start_lat = params[:lat]
    start_lon = params[:lon]
    trip_time_mins = params[:trip_time]

    # create the origin stop 
    @stop0 = Stop.new(lat: start_lat, lon: start_lon)

    # current point lat/lon
    point_lat = start_lat
    point_lon = start_lon
    
    # initialize remaining time variable
    remaining_time_mins = trip_time_mins

    # initialize the trip array - array of instances of stops add origin to the array
    @my_trip = []
    @my_trip << @stop0


    while remaining_time_mins.positive?
      
      # calculate the max distance with the time given
      # 83 mts / min is average walking speed
      max_distance_mts = 83 * remaining_time_mins
      
      #### find the array of locations between [start_lat,start_lon] and the max_distance_mts
      # locations = array_of_locs(start_lat, start_lon, max_distance_mts)
      locations = Stop.all


      ### remove the trip stops already selected for the trip from the locations array
      # ********* this asumes the origin is not a location on our database.
      #  need to optimize this to check if it's in the databse ************
      my_trip.each do |stop|
        locations.reject! { |loc| loc.id == stop.id }
      end


      ### find the distance between my current location and all the points in the array,
      ### calculate the total_time = walking time to each distace + the visit time. 
      ### sort by the result by shortest total time
      ### walking time [mins] = distance [mts] / 83
      loc = []
      locations.each.with_index do |location, i|
        distance_mts = Geocoder::Calculations.distance_between([point_lat, point_lon], [location.lat, location.lon]) * 1_000
        # puts "distance in meters from origin #{i}: #{distance_mts}"
        # puts "location time visit: #{location.visit_time}"
        # puts "walking time to location: #{distance_mts / 83}"
        total_time = ( distance_mts / 83 ) + location.visit_time
        # puts "total time location: #{total_time}"
        loc << [location, total_time]
      end
      puts loc
      # sorted_locs = objects.sort_by(&:total_time)

      ### remove the points in the array where the total time is larger than the remaining_time_mins

      ### get the size of the array_of_locs
      
      ### if its more than 5: 
        ### n = calculate what is the nearest integer to 30% of the size

      ### if its 5 or less:
        ### n = the size af the array_of_locs
      
      ### randomly choose between the first n stops
      sorted_locs[rand(0..n)] 

      # the real time it takes to get to and visit the stop = walk_time + visit_time
      current_stop_time_mins = 0
      remaining_time_mins -= current_stop_time_mins
    end  

    
  end

  def array_of_locs
    Stop.all    
  end
  
  
end
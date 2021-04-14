class Api::V1::TripsController < Api::V1::BaseController
  # def index
  #   @stories = Story.all
  #   render json: @stories #Just for testing
  # end

  def create

    start_lat = params[:lat]
    start_lon = params[:lon]
    trip_time_mins = params[:trip_time]
    
### for testing only ###
    start_lat = 31.2288438
    start_lon = 121.4753802
    trip_time_mins = 200
    #########################

    walking_speed = 83

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

    puts "*>*>*>*>*>*>*>*>*>*>*>\nremaining time: #{remaining_time_mins}"


    while remaining_time_mins.positive?
      
      # calculate the max distance with the time given
      # 83 mts / min is average walking speed
      max_distance_mts = walking_speed * remaining_time_mins
      
      #### find the array of locations between [start_lat,start_lon] and the max_distance_mts
      # locations = array_of_locs(start_lat, start_lon, max_distance_mts)
      locations = Stop.all


      ### remove the trip stops already selected for the trip from the locations array
      # ********* this asumes the origin is not a location on our database.
      #  need to optimize this to check if it's in the databse ************
      @my_trip.each do |stop|
        puts "my_trip stop ID = #{stop.id}"
        locations = locations.reject { |location| location.id == stop.id }
      end


      ### find the distance between my current location and all the points in the array,
      ### calculate the total_time = walking time to each distace + the visit time. 
      ### walking time [mins] = distance [mts] / 83
      locations.each do |location|
        location.total_time = 0
        distance_mts = Geocoder::Calculations.distance_between([point_lat, point_lon], [location.lat, location.lon]) * 1_000
        total_time = (distance_mts / walking_speed) + location.visit_time
        location.total_time = total_time
      end
      
      ### remove the points in the array where the total time is larger than the remaining_time_mins
      small_list = locations.reject { |location| location.total_time > remaining_time_mins.to_f }
      
      
      ### sort by the result by shortest total time
      sorted_locs = small_list.sort_by(&:total_time)

      
      ### if its more than 10: 
        ### n = calculate what is the nearest integer to 33% of the size

      ### if its 10 or less:
        ### n = the size af the array_of_locs
      if sorted_locs.size > 10
        n = (sorted_locs.size / 3).ceil 
      else
        n = sorted_locs.size
      end
      
      
      ### randomly choose between the first n stops
      puts "sorted locs size = #{n}"
      puts "sorted locs: #{sorted_locs}"
      if n != 0
        next_stop = sorted_locs[rand(0...n)]  #<<<<<<<<<<<<  need to make sure that if n=0 then the program

        @my_trip << next_stop

        point_lat = next_stop.lat
        point_lon = next_stop.lon
      end
      
      
      # the real time it takes to get to and visit the stop = walk_time + visit_time
      remaining_time_mins -= next_stop.total_time
      puts "*********************"
      puts "next stop name: #{next_stop.name}"
      puts "remaining time: #{remaining_time_mins}"
      puts "*********************"
    end

    puts @my_trip
    
  end

  def test_start
    ### for testing only ###
    start_lat = 31.2288438
    start_lon = 121.4753802
    trip_time_mins = 400
    #########################

    walking_speed = 83
  end

  def array_of_locs
    Stop.all    
  end
  
  
end
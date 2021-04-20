class Api::V1::TripsController < Api::V1::BaseController
  before_action :set_trip, only: %i[update show]
  # def index
  #   @stories = Story.all
  #   render json: @stories #Just for testing
  # end

  def create
    @trip = Trip.new(trip_params)
    @trip.current_stop = 0
    @trip.active = false
    # @trip.user = User.find(params[:user_id])
    if @trip.save
      @my_trip = calculate_trip
      puts @my_trip
      @my_trip.each do |stop|
        TripStop.create(stop_id: stop.id, trip: @trip)
      end
      render json: { msg: 'Created', trip_id: @trip.id }
    else
      render_error(@trip)
    end
  end

  def show
  end

  def update
    if @trip.update(trip_params)
      render json: { msg: 'Updated' }
    else
      render_error(@trip)
    end
  end

  def calculate_trip
    @stopstodelete = Stop.where(name: nil)
    @stopstodelete.destroy_all

    point_lat = @trip.start_lat
    point_lon = @trip.start_lon
    remaining_time_mins = @trip.duration

    #### for testing only ####
    # start_lat = 31.2288438
    # start_lon = 121.4753802
    # remaining_time_mins = 200
    #########################

    # average human walking speed 75 mts / min
    walking_speed = 75

    # create the origin stop - where the user is when he creates the trip
    @stop0 = Stop.create(lat: point_lat, lon: point_lon)
    puts @stop0

    # initialize the trip arrays - array of instances of stops add origin to the array and array of ID's of stops
    @my_trip = []
    @my_trip << @stop0


    puts "*>*>*>*>*>*>*>*>*>*>*>\noriginal remaining time: #{remaining_time_mins}\n*>*>*>*>*>*>*>*>*>*>*>"

    while remaining_time_mins.positive?

      # calculate the max distance with the time given
      # 83 mts / min is average walking speed
      # max_distance_mts = walking_speed * remaining_time_mins

      #### find the array of locations between [start_lat,start_lon] and the max_distance_mts
      # locations = array_of_locs(start_lat, start_lon, max_distance_mts)
      locations = Stop.all

      ### remove the trip stops already selected for the trip from the locations array
      # ********* this asumes the origin is not a location on our database.
      #  need to optimize this to check if it's in the databse ************
      @my_trip.each do |stop|
        puts "stop ID = #{stop.id}"
        locations = locations.reject { |location| location.id == stop.id }
      end

      ### find the distance between my current location and all the points in the array,
      ### calculate the total_time = walking time to each distace + the visit time.
      ### walking time [mins] = distance [mts] / 83
      ### distance_mts is manhattan distance and not direct distance. d = direct_distance * sqr(2)
      locations.each do |location|
        location.total_time = 0
        distance_mts = Geocoder::Calculations.distance_between([point_lat, point_lon], [location.lat, location.lon]) * 1_000 * 1.41421
        total_time = (distance_mts / walking_speed) + location.visit_time
        location.total_time = total_time
      end

      ### remove the points in the array where the total time is larger than the remaining_time_mins
      small_list = locations.reject { |location| location.total_time > remaining_time_mins.to_f }

      ### sort the result by shortest total time
      sorted_locs = small_list.sort_by(&:total_time)

      ### if its more than 10: n = calculate what is the nearest integer to 33% of the size
      ### if its 10 or less: n = the size af the array_of_locs
      n = sorted_locs.size > 10 ? (sorted_locs.size / 3).ceil : sorted_locs.size

      ### randomly choose between the first n stops
      if n != 0
        next_stop = sorted_locs[rand(0...n)]

        @my_trip << next_stop


        # set the new location as starting point for the next search
        point_lat = next_stop.lat
        point_lon = next_stop.lon
        puts '*********************'
        puts "next stop name: #{next_stop.name}"
      end

      remaining_time_mins -= next_stop.total_time

      puts "remaining time: #{remaining_time_mins}"
      puts '*********************'
    end
    @stop0.destroy
    @my_trip = sort_stops
    @my_trip
  end

  private

  def sort_stops
    # calculate the distance from origin to each stop in the trip to sort them
    @my_trip.delete_at(0)
    @my_trip.each do |stop|
      stop.total_time = Geocoder::Calculations.distance_between([@trip.start_lat, @trip.start_lon], [stop.lat, stop.lon]) * 1_000
    end
    @my_sorted_trip =@my_trip.sort_by(&:total_time)
    return @my_sorted_trip
  end
  

  def trip_params
    params.require(:trip).permit(:duration, :start_lat, :start_lon, :user_id, :active)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end

end

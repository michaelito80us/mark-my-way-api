class Api::V1::TripsController < Api::V1::BaseController
  def index
    @stories = Story.all
    render json: @stories #Just for testing
  end
end
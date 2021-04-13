class Api::V1::StopsController < Api::V1::BaseController
  def show
    @stop = Stop.find(params[:id])
  end
end

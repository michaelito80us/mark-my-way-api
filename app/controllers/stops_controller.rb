class StopsController < ApplicationController
before_action :set_stop, only: [:edit, :show, :update]

  def index
    @stops = Stop.all
  end  

  def show
    @stop = Stop.find(params[:id])
  end

  def create
    stop = Stop.create!(stop_params)
    redirect_to message
  end

  def edit
  end

  def update
    if @stop.update(stop_params)
      redirect_to @stop, notice: 'Stop was successfully updated.'
    else
      render :edit
    end
  end

  private

  def stop_params
    params.require(:stop).permit(:lat, :lon, :name, :address, :category, :photo1, :photo2, :photo3, :visit_time, :introduction, photos:[])
  end

  def set_stop
      @stop = Stop.find(params[:id])
  end
end

class StopsController < ApplicationController
before_action :set_stop, only: [:edit, :show, :update, :destroy]

  def index
    @stops = Stop.all
  end  

  def show
    @stop = Stop.find(params[:id])
  end

  def create
    Stop.create!(stop_params)
    redirect_to stops_path, notice: 'Stop was successfully created.'
  end

  def edit
  end

  def new
    @stop = Stop.new
  end

  def destroy
    @stop.destroy
    redirect_to stops_path, notice: 'Stop was successfully destroyed.'
  end

  def delete_image_attachment
    @image = ActiveStorage::Blob.find_signed(params[:id])
    @image.attachments.first.purge
    redirect_back fallback_location: stops_path
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
    params.require(:stop).permit(:lat, :lon, :name, :address, :category, :photo1, :photo2, :photo3, :visit_time, :introduction, images:[])
  end

  def set_stop
      @stop = Stop.find(params[:id])
  end
end

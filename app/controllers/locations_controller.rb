class LocationsController < ApplicationController
  def new
    @location=Location.new
  end
  def index
    @locations=Location.all
  end
  def create
    @locations=Location.new(locations_param)
    if @locations.save
      redirect_to locations_url
    else
      render 'new'
    end
  end
  def edit
     @location = Location.find_by(id: params[:id])
  end
  def update
    @location = Location.find_by(id: params[:id])

    if @location.update(locations_param)
      redirect_to locations_path
    else
      render "edit"
    end
  end
  def destroy
    @location=Location.find_by(id: params[:id])
    if @location.destroy
      redirect_to locations_url
    end
  end
  private
  def locations_param
    params.require(:location).permit(:name)
  end
end

class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.where.not(latitude: nil, longitude: nil)

    @markers = @facilities.map do |facility|
      {
        lat: facility.latitude,
        lng: facility.longitude
      }
    end
  end

  def show
    @facility = Facility.find(params[:id])
  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facilities_params)
    if @facility.save
      redirect_to @facility, notice: "Added Successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def facilities_params
    params.require(:facility).permit(:name, :address, :types)
  end
end

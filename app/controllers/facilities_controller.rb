class FacilitiesController < ApplicationController
  responders :flash, :http_cache

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
    flash[:notice] = "Facility was successfully created." if @facility.save
    respond_with(@facility)
    # respond_to do |format|
    #   if @facility.save
    #     format.js { render 'create' }
    #     redirect_to @facility, notice: "Added Successfully!"
    #   else
    #     format.html { render :new }
    #   end
    # end
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

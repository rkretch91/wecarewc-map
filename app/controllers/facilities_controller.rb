class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all
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
    params.require(:facility).permit(:name, :location, :type)
  end
end

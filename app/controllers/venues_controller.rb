class VenuesController < ApplicationController
  before_action :authenticate_promoter!

  def new
    @venue = Venue.new
  end

  def create
    @venue = current_promoter.venues.create(venue_params)
    @venues = current_promoter.venues
    if @venue.save
      flash.now[:notice] = "#{@venue.name} has been added."
    else
      flash.now[:alert] = "Venue could not be created."
    end
  end

  def show
    @venue = Venue.find(params[:id])
    @concerts = @venue.concerts
  end

  protected
    def venue_params
      params.require(:venue).permit(:name, :street_address, :city, :state, :zip_code, :contact_name, :contact_number)
    end
end
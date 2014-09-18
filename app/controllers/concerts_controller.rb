class ConcertsController < ApplicationController
  before_action :authenticate_promoter!

  def new
    @concert = Concert.new
    @venues = current_promoter.venues
  end

  def create
    concert = current_promoter.concerts.create(concert_params)
    @concerts = Concert.all
    if concert.save
      flash.now[:notice] = "#{concert.headliner} concert has been added."
    else
      flash.now[:alert] = "Concert could not be created."
    end
  end

  protected
    def concert_params
      params.require(:concert).permit(:headliner, :date, :venue_id)
    end
end

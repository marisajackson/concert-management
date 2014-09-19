class ConcertsController < ApplicationController
  before_action :authenticate_promoter!

  def create
    concert = current_promoter.concerts.create(concert_params)
    @concerts = current_promoter.concerts.order(date: :asc);
    @upcoming_concerts = current_promoter.concerts.where("date < ?", Date.today.end_of_week).order(date: :asc);
    if concert.save
      flash.now[:notice] = "#{concert.headliner} concert has been added."
    else
      flash.now[:alert] = "Concert could not be created."
    end
  end
  
  def new
    @concert = Concert.new
    @venues = current_promoter.venues
  end

  def show
    @concert = Concert.find(params[:id])
  end

  protected
    def concert_params
      params.require(:concert).permit(:headliner, :date, :venue_id)
    end
end

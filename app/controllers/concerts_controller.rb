class ConcertsController < ApplicationController
  before_action :authenticate_promoter!

  def create
    @concert = current_promoter.concerts.create(concert_params)
    @concerts = current_promoter.concerts.order(date: :asc);
    @upcoming_concerts = current_promoter.concerts.where("date < ?", Date.today + 1.week).order(date: :asc);
    if @concert.save
      flash.now[:notice] = "#{@concert.headliner} concert has been added."
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

  def update
    @concert = Concert.find(params[:id])
    if @concert.update_attributes(concert_params)
      flash.now[:notice] = "The #{@concert.headliner} concert has been updated."
    else
      flash.now[:alert] = "The concert could not be updated."
    end
    @concerts = current_promoter.concerts.order(date: :asc);
    @upcoming_concerts = current_promoter.concerts.where("date < ?", Date.today + 1.week).order(date: :asc);
  end

  protected
    def concert_params
      params.require(:concert).permit(:headliner, :date, :venue_id, :employee_id)
    end
end

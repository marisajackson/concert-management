class PromotersController < ApplicationController

  def dashboard
    @venues = current_promoter.venues.all
    @concerts = current_promoter.concerts.all
  end
end
class PromotersController < ApplicationController

  def dashboard
    @venues = Venue.all
  end
end
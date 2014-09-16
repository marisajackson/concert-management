class PromotersController < ApplicationController
  def dashboard
    @venues = current_promoter.venues.all
    @concerts = current_promoter.concerts.all
    @invitees = get_invitees()
  end

  def get_invitees
    invitees = []
    current_promoter.employees.each do |employee|
      if employee.invitation_accepted_at.nil?
        invitees << employee
      end
    end
    invitees
  end
end
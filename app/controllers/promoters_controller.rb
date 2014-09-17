class PromotersController < ApplicationController
  def invites
    employee = Employee.find(params[:employee])
    flash.now[:notice] = "An invitation email has been sent to #{employee.email}."
    @invitees = get_invitees()
  end

  def dashboard
    @employee = Employee.new
    @concert = Concert.new
    @venue = Venue.new
    @venues = current_promoter.venues.all
    @upcoming_concerts = current_promoter.concerts.where("date < ?", Date.today.end_of_week)
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
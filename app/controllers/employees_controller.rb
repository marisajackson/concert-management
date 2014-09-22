class EmployeesController < ApplicationController
  before_action :authenticate_employee!
  
  def dashboard
    # @employee = Employee.new
    # @concert = Concert.new
    # @venue = Venue.new
    # @venues = current_promoter.venues.all
    # @upcoming_concerts = current_promoter.concerts.where("date < ?", Date.today + 1.week).order(date: :asc);
    # @concerts = current_promoter.concerts.all.order(date: :asc);
    # @invitees = current_promoter.employees.where("sign_in_count = ?", 0);
  end

  def finances
    
  end
end
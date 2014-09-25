class EmployeesController < ApplicationController
  before_action :authenticate_employee!
  
  def dashboard
  end

  def concert
    @concert = Concert.find(params[:id])
    @expenses = @concert.expenses.where("viewable_by_employee = ?", true)
    @incomes = @concert.incomes.where("viewable_by_employee = ?", true)
  end
end
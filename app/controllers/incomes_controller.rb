class IncomesController < ApplicationController
  before_action :authenticate_promoter!

  def new
    @income = Income.new
  end

  def create
    @concert = Concert.find(params[:concert_id])
    income = @concert.incomes.create(income_params)
    if income.save
      flash.now[:notice] = "#{income.name} has been added to the #{income.income_category.name} Income Category."
    else
      flash.now[:alert] = "Income could not be created."
    end
  end

  protected
    def income_params
      params.require(:income).permit(:income_category_id, :name, :expected_revenue, :viewable_by_employee)
    end
end
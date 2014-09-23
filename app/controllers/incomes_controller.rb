class IncomesController < ApplicationController
  before_action :authenticate_promoter!

  def new
    @income = Income.new
  end

  def create
    @concert = Concert.find(params[:concert_id])
    income_category = IncomeCategory.find_by(name: params[:income][:income_category][:name])

    if income_category.nil?
      @income_category = IncomeCategory.create(name: params[:income][:income_category][:name], promoter: current_promoter)
    else
      @income_category = income_category
    end

    income = Income.new(income_category: @income_category, concert: @concert, name: income_params[:name], expected_revenue: income_params[:expected_revenue], viewable_by_employee: income_params[:viewable_by_employee])

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
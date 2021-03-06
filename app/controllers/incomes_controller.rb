class IncomesController < ApplicationController
  before_action :authenticate_promoter!
  skip_before_action :authenticate_promoter!, only: [:update]
  before_action :authenticate_user!, only: [:update]

  def new
    @income = Income.new
  end

  def create
    @concert = Concert.find(params[:concert_id])
    @concert.update_attributes(updated_at: Time.now)
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

  def update
    @income = Income.find(params[:id])
    if @income.update_attributes(income_params)
      flash.now[:notice] = "The #{@income.name} income has been updated."
    else
      flash.now[:alert] = "Income could not be updated."
    end
    @concert = Concert.find(params[:concert_id])
    @concert.update_attributes(updated_at: Time.now)
    @incomes = @concert.incomes.where("viewable_by_employee = ?", true)
  end

  protected
    def income_params
      params.require(:income).permit(:income_category_id, :name, :expected_revenue, :viewable_by_employee, :actual_cost)
    end

    def authenticate_user!
      if employee_signed_in?
        true
      else
        authenticate_promoter!
      end
    end
end
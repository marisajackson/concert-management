class ExpensesController < ApplicationController
  before_action :authenticate_promoter!

  def new
    @expense = Expense.new
  end

  def create
    @concert = Concert.find(params[:concert_id])
    expense = @concert.expenses.create(expense_params)
    if expense.save
      flash.now[:notice] = "#{expense.name} has been added to the #{expense.expense_category.name} Expense Category."
    else
      flash.now[:alert] = "Expense could not be created."
    end
  end

  protected
    def expense_params
      params.require(:expense).permit(:expense_category_id, :name, :expected_cost, :viewable_by_employee)
    end
end
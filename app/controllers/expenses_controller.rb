class ExpensesController < ApplicationController
  before_action :authenticate_promoter!

  def new
    @expense = Expense.new
  end

  def create
    @concert = Concert.find(params[:concert_id])
    @concert.update_attributes(updated_at: Time.now)
    expense_category = ExpenseCategory.find_by(name: params[:expense][:expense_category][:name])

    if expense_category.nil?
      @expense_category = ExpenseCategory.create(name: params[:expense][:expense_category][:name], promoter: current_promoter)
    else
      @expense_category = expense_category
    end

    expense = Expense.new(expense_category: @expense_category, concert: @concert, name: expense_params[:name], expected_cost: expense_params[:expected_cost], viewable_by_employee: expense_params[:viewable_by_employee])

    if expense.save
      flash.now[:notice] = "#{expense.name} has been added to the #{expense.expense_category.name} Expense Category."
    else
      flash.now[:alert] = "Expense could not be created."
    end
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update_attributes(expense_params)
      flash.now[:notice] = "The #{@expense.name} expense has been updated."
    else
      flash.now[:alert] = "Expense could not be updated."
    end
    @concert = Concert.find(params[:concert_id])
    @concert.update_attributes(updated_at: Time.now)
  end

  protected
    def expense_params
      params.require(:expense).permit(:name, :expected_cost, :viewable_by_employee, :actual_cost)
    end
end
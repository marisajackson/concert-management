class ExpenseCategoriesController < ApplicationController

  def new
    @expense_category = ExpenseCategory.new
  end

  def create
    @expense_category = current_promoter.expense_categories.create(expense_category_params);
    if @expense_category.save
      flash.now[:notice] = "#{@expense_category.name} has been added to the Expense Categories."
    else
      flash.now[:alert] = "Expense category could not be created."
    end
  end

  protected
    def expense_category_params
      params.require(:expense_category).permit(:name)
    end
end
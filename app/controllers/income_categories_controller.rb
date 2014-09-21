class IncomeCategoriesController < ApplicationController

  def new
    @income_category = IncomeCategory.new
  end

  def create
    @income_category = current_promoter.income_categories.create(income_category_params);
    if @income_category.save
      flash.now[:notice] = "#{@income_category.name} has been added to the Income Categories."
    else
      flash.now[:alert] = "Income category could not be created."
    end
  end

  protected
    def income_category_params
      params.require(:income_category).permit(:name)
    end
end
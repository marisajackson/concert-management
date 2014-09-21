class Expense < ActiveRecord::Base
  belongs_to :concert
  belongs_to :expense_category
end

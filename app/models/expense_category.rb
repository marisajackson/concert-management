class ExpenseCategory < ActiveRecord::Base
  belongs_to :promoter
  has_many :expenses
end

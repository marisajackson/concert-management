class IncomeCategory < ActiveRecord::Base
  belongs_to :promoter
  has_many :incomes
end

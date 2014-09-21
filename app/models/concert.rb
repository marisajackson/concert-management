class Concert < ActiveRecord::Base
  belongs_to :promoter
  belongs_to :venue
  has_many :expenses
  has_many :incomes
  has_many :expense_categories, -> {uniq}, through: :expenses
  has_many :income_categories, -> {uniq}, through: :incomes
end

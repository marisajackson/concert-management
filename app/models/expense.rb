class Expense < ActiveRecord::Base
  belongs_to :concert
  belongs_to :expense_category
  attr_accessor :difference

  def difference
    if self.actual_cost.nil?
      actual = 0
    else
      actual = self.actual_cost
    end
    return self.expected_cost - actual
  end
end

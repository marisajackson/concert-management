class Income < ActiveRecord::Base
  belongs_to :concert
  belongs_to :income_category
  attr_accessor :difference

  def difference
    if self.actual_cost.nil?
      actual = 0
    else
      actual = self.actual_cost
    end
    return self.expected_revenue - actual
  end
end

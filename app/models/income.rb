class Income < ActiveRecord::Base
  belongs_to :concert
  belongs_to :income_category
end

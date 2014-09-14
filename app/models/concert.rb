class Concert < ActiveRecord::Base
  belongs_to :promoter
  belongs_to :venue
end

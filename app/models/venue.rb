class Venue < ActiveRecord::Base
  belongs_to :promoter
  has_many :concerts
end

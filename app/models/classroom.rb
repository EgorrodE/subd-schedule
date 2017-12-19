class Classroom < ActiveRecord::Base
  belongs_to :case
  belongs_to :classroom_type
  has_many :pairs
end

class Subject < ActiveRecord::Base
  has_many :classroom_type_subjects
  has_and_belongs_to_many :classroom_types
  has_many :pairs
  has_many :teachers, through: :pairs
end

class ClassroomType < ActiveRecord::Base
  has_many :classrooms
  has_many :classroom_type_subjects
  has_and_belongs_to_many :subjects
end

class ClassroomTypesSubject < ActiveRecord::Base
  belongs_to :subject
  belongs_to :classroom_type
end

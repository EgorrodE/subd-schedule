class Teacher < ActiveRecord::Base
  has_many :pairs
  has_many :subjects, through: :pairs
end

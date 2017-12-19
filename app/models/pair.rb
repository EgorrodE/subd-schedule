class Pair < ActiveRecord::Base
  belongs_to :classroom
  belongs_to :teacher
  belongs_to :subject
  belongs_to :schedule_place
end

class Weekday < ActiveRecord::Base
  has_many :schedule_places
end
